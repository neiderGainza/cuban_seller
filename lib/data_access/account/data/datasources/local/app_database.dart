import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'package:cuban_seller/data_access/account/data/mapper/account_mapper.dart';
import 'package:cuban_seller/data_access/account/data/mapper/coin_mapper.dart';

import 'package:cuban_seller/data_access/account/data/models/account_model.dart';
import 'package:cuban_seller/data_access/account/data/models/coin_model.dart';

import 'package:cuban_seller/data_access/account/domain/entities/account.dart';
import 'package:cuban_seller/data_access/account/domain/entities/coin.dart';

import 'package:cuban_seller/data_access/account/domain/usecases/insert_account_usecases.dart';
import 'package:cuban_seller/data_access/account/domain/usecases/update_account_usecases.dart';
import 'package:cuban_seller/data_access/account/domain/usecases/insert_coin_usecases.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [CoinModel, AccountModel])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  // ---------------- ACCOUNT METHODS ----------------
  Future<List<Account>> getAccountsByName(String name) async {
    final query = select(accountModel)..where((t) => t.name.like('$name%'));
    return query.map(AccountMapper.toEntity).get();
  }

  /// Inserta una cuenta nueva y retorna la entidad de dominio.
  Future<Account?> insertAccount(InsertAccountParam param) async {
    final companion = AccountMapper.toCompanionFromInsertParam(param);

    final id = await into(accountModel).insert(companion);
    return getAccountById(id);
  }

  /// Elimina una cuenta por id, retornando true si se borró algo.
  Future<bool> deleteAccount(int id) async {
    final rowsDeleted = await (delete(
      accountModel,
    )..where((t) => t.id.equals(id))).go();
    return rowsDeleted > 0;
  }

  /// Obtiene todas las cuentas mapeadas a entidades de dominio.
  Future<List<Account>> get allAccounts async {
    final rows = await select(accountModel).get();
    return rows.map(AccountMapper.toEntity).toList();
  }

  /// Actualiza una cuenta y retorna la cuenta actualizada, o null si no existe.
  Future<Account?> updateAccount(int id, UpdateAccountParam param) async {
    // Comprobar que existe
    final existing = await getAccountById(id);
    if (existing == null) {
      return null;
    }

    // Mapear a companion de actualización con id incluido
    final companion = AccountMapper.toCompanionFromUpdateParam(id, param);

    final success = await (update(
      accountModel,
    )..where((tbl) => tbl.id.equals(id))).write(companion);

    if (!(success > 0)) {
      return null;
    }

    return getAccountById(id);
  }

  /// Obtiene una cuenta por id, o null si no existe.
  Future<Account?> getAccountById(int id) async {
    try {
      final row = await (select(
        accountModel,
      )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

      if (row == null) {
        return null;
      }
      return AccountMapper.toEntity(row);
    } catch (e) {
      // Aquí se podría loguear el error con algún logger de la app.
      rethrow;
    }
  }

  // ---------------- COIN METHODS ----------------

  /// Inserta una moneda y retorna la entidad de dominio.
  Future<Coin> insertCoin(CoinParameters params) async {
    final companion = CoinMapper.toCompanionFromParam(params);
    await into(coinModel).insert(companion);

    // Si la entidad Coin tiene más campos, lo ideal sería recuperar la fila real
    // desde la base de datos. Si solo es el value, se puede mapear directo.
    return CoinMapper.toEntityFromParam(params);
  }

  /// Elimina una moneda por su valor. Devuelve true si se borró algo.
  Future<bool> deleteCoin(CoinParameters params) async {
    final rowsDeleted = await (delete(
      coinModel,
    )..where((t) => t.value.equals(params.value))).go();
    return rowsDeleted > 0;
  }

  /// Obtiene todas las monedas mapeadas a entidades de dominio.
  Future<List<Coin>> get allCoins async {
    final rows = await select(coinModel).get();
    return rows.map(CoinMapper.toEntity).toList();
  }

  // ---------------- DB CONNECTION ----------------

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationSupportDirectory();
      final file = File(p.join(dbFolder.path, 'my_database.sqlite'));
      return NativeDatabase(file);
    });
  }
}

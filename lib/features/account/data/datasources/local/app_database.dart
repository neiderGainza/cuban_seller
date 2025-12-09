import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

import 'package:cuban_seller/features/account/data/mapper/coin_mapper.dart';
import 'package:cuban_seller/features/account/data/models/coin_model.dart';
import 'package:cuban_seller/features/account/domain/entities/coin.dart';
import 'package:cuban_seller/features/account/domain/usecases/insert_coin_usecases.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [CoinModel])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  Future<Coin> insertCoin(CoinParameters value) async {
    await into(coinModel).insert(CoinModelCompanion(value: Value(value.value)));
    return Coin(value: value.value);
  }

  Future deleteCoin(CoinParameters params) async {
    return (delete(coinModel)..where((t) => t.value.equals(params.value))).go();
  }

  Future<List<Coin>> get allCoins async =>
      (await select(coinModel).get()).map(CoinMapper.toMap).toList();

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationSupportDirectory();
      final file = File(p.join(dbFolder.path, 'my_database.sqlite'));
      return NativeDatabase(file);
    });
  }
}

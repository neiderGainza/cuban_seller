import 'package:cuban_seller/data_access/account/data/datasources/local/app_database.dart';
import 'package:cuban_seller/data_access/account/domain/entities/coin.dart';
import 'package:cuban_seller/data_access/account/domain/usecases/insert_account_usecases.dart';
import 'package:cuban_seller/data_access/account/domain/usecases/insert_coin_usecases.dart';
import 'package:cuban_seller/data_access/account/domain/usecases/update_account_usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(
      DatabaseConnection(
        NativeDatabase.memory(),
        closeStreamsSynchronously: true,
      ),
    );
  });

  tearDown(() async {
    await db.close();
  });

  // ---------------- Tests for Account CRUD ----------------
  group('Account CRUD', () {
    test('insertAccount inserta y devuelve la cuenta', () async {
      final param = InsertAccountParam(
        name: 'Cuenta prueba',
        amount: 100.0,
        coin: Coin(value: 'USD'),
      );

      final account = await db.insertAccount(param);

      // Comprobaciones
      expect(account!.id, isPositive);
      expect(account.name, 'Cuenta prueba');
      expect(account.amount, 100.0);
      expect(account.coin.value, 'USD');
    });

    test('deleteAccount elimina la cuenta y devuelve true', () async {
      final param = InsertAccountParam(
        name: 'Cuenta a eliminar',
        amount: 50.0,
        coin: Coin(value: 'EUR'),
      );

      final account = await db.insertAccount(param);
      final deleted = await db.deleteAccount(account!.id);

      expect(deleted, isTrue);
    });

    test('allAccounts devuelve todas las cuentas insertadas', () async {
      final param1 = InsertAccountParam(
        name: 'Cuenta 1',
        amount: 200.0,
        coin: Coin(value: 'USD'),
      );
      final param2 = InsertAccountParam(
        name: 'Cuenta 2',
        amount: 300.0,
        coin: Coin(value: 'EUR'),
      );

      await db.insertAccount(param1);
      await db.insertAccount(param2);

      final accounts = await db.allAccounts;

      expect(accounts.length, 2);
      expect(accounts[0].name, 'Cuenta 1');
      expect(accounts[1].name, 'Cuenta 2');
    });
  });

  test(
    'updateAccount actualiza la cuenta y devuelve la cuenta actualizada',
    () async {
      final insertParam = InsertAccountParam(
        name: 'Cuenta a actualizar',
        amount: 150.0,
        coin: Coin(value: 'GBP'),
      );

      final account = await db.insertAccount(insertParam);

      final updateParam = UpdateAccountParam(
        name: 'Cuenta actualizada',
        amount: 175.0,
        coin: Coin(value: 'USD'),
      );

      final updatedAccount = await db.updateAccount(account!.id, updateParam);

      expect(updatedAccount!.name, 'Cuenta actualizada');
      expect(updatedAccount.amount, 175.0);
      expect(updatedAccount.coin.value, 'USD');
    },
  );
  test(
    'getAccountsByName devuelve todas las cuentas que coinciden con el nombre',
    () async {
      final param1 = InsertAccountParam(
        name: 'ABBCCCDDDD',
        amount: 200.0,
        coin: Coin(value: 'USD'),
      );
      final param2 = InsertAccountParam(
        name: 'ABCDEFGHIJ',
        amount: 200.0,
        coin: Coin(value: 'USD'),
      );
      final param3 = InsertAccountParam(
        name: 'XYZ',
        amount: 200.0,
        coin: Coin(value: 'USD'),
      );

      await db.insertAccount(param1);
      await db.insertAccount(param2);
      await db.insertAccount(param3);

      final accounts = await db.getAccountsByName("A");
      final accounts1 = await db.getAccountsByName("X");
      final accounts2 = await db.getAccountsByName("");
      final accounts3 = await db.getAccountsByName("Z");

      expect(accounts.length, 2);
      expect(accounts[0].name, 'ABBCCCDDDD');
      expect(accounts[1].name, 'ABCDEFGHIJ');

      expect(accounts1.length, 1);
      expect(accounts1[0].name, 'XYZ');

      expect(accounts2.length, 3);

      expect(accounts3.length, 0);
    },
  );
  test(
    'updateAccount actualiza solo el amount de la cuenta y devuelve la cuenta actualizada',
    () async {
      final insertParam = InsertAccountParam(
        name: 'Cuenta a actualizar',
        amount: 150.0,
        coin: Coin(value: 'GBP'),
      );

      final account = await db.insertAccount(insertParam);

      final updateParam = UpdateAccountParam(amount: 175.0);

      final updatedAccount = await db.updateAccount(account!.id, updateParam);

      expect(updatedAccount!.name, 'Cuenta a actualizar');
      expect(updatedAccount.amount, 175.0);
      expect(updatedAccount.coin.value, 'GBP');
    },
  );

  // ---------------- COIN METHODS ----------------
  group('Coin CRUD', () {
    test('insertCoin inserta y devuelve la moneda', () async {
      CoinParameters params = CoinParameters(value: 'USD');
      final coin = await db.insertCoin(params);

      expect(coin.value, 'USD');
    });

    test('getAllCoins devuelve todas las monedas insertadas', () async {
      CoinParameters params1 = CoinParameters(value: 'USD');
      CoinParameters params2 = CoinParameters(value: 'EUR');
      await db.insertCoin(params1);
      await db.insertCoin(params2);

      final coins = await db.allCoins;

      expect(coins.length, 2);
      expect(coins[0].value, 'USD');
      expect(coins[1].value, 'EUR');
    });
    test('deleteCoin elimina la moneda y devuelve true', () async {
      CoinParameters params = CoinParameters(value: 'JPY');
      await db.insertCoin(params);

      final deleted = await db.deleteCoin(params);

      expect(deleted, isTrue);
    });
  });
}

import 'package:cuban_seller/data_access/account/data/datasources/local/app_database.dart';
import 'package:cuban_seller/data_access/account/domain/entities/coin.dart';
import 'package:cuban_seller/data_access/account/domain/repositories/coin_repository.dart';
import 'package:cuban_seller/data_access/account/domain/usecases/insert_coin_usecases.dart';

class CoinRepositoryImplement implements CoinRepository {
  final AppDatabase _database;

  CoinRepositoryImplement(this._database);

  @override
  Future<bool> deleteCoin(CoinParameters value) async {
    try {
      await _database.deleteCoin(value);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Coin>> getAllCoins() async {
    try {
      return await _database.allCoins;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Coin> insertCoin(CoinParameters value) async {
    try {
      return await _database.insertCoin(value);
    } catch (e) {
      rethrow;
    }
  }
}

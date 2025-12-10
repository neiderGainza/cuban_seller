import 'package:cuban_seller/data_access/account/data/datasources/local/app_database.dart';
import 'package:cuban_seller/data_access/account/domain/entities/coin.dart';
import 'package:cuban_seller/data_access/account/domain/usecases/insert_coin_usecases.dart';
import 'package:drift/drift.dart';

class CoinMapper {
  static Coin toEntity(CoinModelData row) {
    return Coin(value: row.value);
  }

  static CoinModelCompanion toCompanionFromParam(CoinParameters params) {
    return CoinModelCompanion(value: Value(params.value));
  }

  static Coin toEntityFromParam(CoinParameters params) {
    return Coin(value: params.value);
  }
}

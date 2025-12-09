import 'package:cuban_seller/features/account/data/datasources/local/app_database.dart';
import 'package:cuban_seller/features/account/domain/entities/coin.dart';

class CoinMapper {
  static Coin toMap(CoinModelData model) => Coin(value: model.value);
}

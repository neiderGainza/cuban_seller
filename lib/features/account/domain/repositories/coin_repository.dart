import 'package:cuban_seller/features/account/domain/entities/coin.dart';
import 'package:cuban_seller/features/account/domain/usecases/insert_coin_usecases.dart';

abstract class CoinRepository {
  Future<Coin> insertCoin(CoinParameters value);

  Future<List<Coin>> getAllCoins();

  Future<bool> deleteCoin(CoinParameters value);
}

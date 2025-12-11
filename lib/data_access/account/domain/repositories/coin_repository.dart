import 'package:cuban_seller/data_access/account/domain/entities/coin.dart';
import 'package:cuban_seller/data_access/account/domain/usecases/insert_coin_usecases.dart';

abstract class CoinRepository {
  Future<Coin> insertCoin(CoinParameters value);

  Future<List<Coin>> getAllCoins();

  // Neider : metodo para tomar un stream de las coins
  Stream<List<Coin>> getStreamAllCoins();

  Future<bool> deleteCoin(CoinParameters value);
}

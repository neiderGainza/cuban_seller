import 'package:cuban_seller/data_access/account/domain/entities/coin.dart';
import 'package:cuban_seller/data_access/account/domain/repositories/coin_repository.dart';

class InsertCoinUsecases {
  final CoinRepository repository;

  InsertCoinUsecases(this.repository);

  Future<Coin> call(CoinParameters coin) async => repository.insertCoin(coin);
}

class CoinParameters {
  final String value;

  CoinParameters({required this.value});
}

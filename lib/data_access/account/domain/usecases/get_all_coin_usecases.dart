import 'package:cuban_seller/data_access/account/domain/entities/coin.dart';
import 'package:cuban_seller/data_access/account/domain/repositories/coin_repository.dart';

class GetAllCoinUsecases {
  final CoinRepository repository;

  GetAllCoinUsecases(this.repository);

  Future<List<Coin>> call() async => repository.getAllCoins();
}

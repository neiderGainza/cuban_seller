import 'package:cuban_seller/features/account/domain/entities/coin.dart';
import 'package:cuban_seller/features/account/domain/repositories/coin_repository.dart';

class GetAllCoinUsecases {
  final CoinRepository repository;

  GetAllCoinUsecases(this.repository);

  Future<List<Coin>> call() async => repository.getAllCoins();
}

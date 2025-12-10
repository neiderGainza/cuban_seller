import 'package:cuban_seller/data_access/account/domain/repositories/coin_repository.dart';
import 'package:cuban_seller/data_access/account/domain/usecases/insert_coin_usecases.dart';

class DeleteCoinUsecases {
  final CoinRepository repository;

  DeleteCoinUsecases(this.repository);

  Future<bool> call(CoinParameters coin) async => repository.deleteCoin(coin);
}

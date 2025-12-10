import 'package:cuban_seller/features/account/domain/entities/account.dart';
import 'package:cuban_seller/features/account/domain/entities/coin.dart';
import 'package:cuban_seller/features/account/domain/repositories/account_repository.dart';

class InsertAccountUsecases {
  final AccountRepository repository;

  InsertAccountUsecases(this.repository);

  Future<Account?> call(InsertAccountParam account) async =>
      repository.insertAccount(account);
}

class InsertAccountParam {
  final String name;
  final double amount;
  final Coin coin;

  InsertAccountParam({
    required this.name,
    required this.amount,
    required this.coin,
  });
}

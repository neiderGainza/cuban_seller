import 'package:cuban_seller/features/account/domain/entities/account.dart';
import 'package:cuban_seller/features/account/domain/repositories/account_repository.dart';

class GetAllAccountUsecases {
  final AccountRepository repository;

  GetAllAccountUsecases(this.repository);

  Future<List<Account>> call() async => repository.getAccounts();
}

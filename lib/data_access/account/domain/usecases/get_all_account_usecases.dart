import 'package:cuban_seller/data_access/account/domain/entities/account.dart';
import 'package:cuban_seller/data_access/account/domain/repositories/account_repository.dart';

class GetAllAccountUsecases {
  final AccountRepository repository;

  GetAllAccountUsecases(this.repository);

  Future<List<Account>> call() async => repository.getAccounts();
}

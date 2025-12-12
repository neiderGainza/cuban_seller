import 'package:cuban_seller/data_access/account/domain/entities/account.dart';
import 'package:cuban_seller/data_access/account/domain/repositories/account_repository.dart';

class GetByNameUsecases {
  final AccountRepository _repository;

  GetByNameUsecases(this._repository);

  Future<List<Account>> call(String name) async {
    return await _repository.getAccountsByName(name);
  }
}

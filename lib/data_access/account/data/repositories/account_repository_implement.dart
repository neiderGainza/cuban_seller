import 'package:cuban_seller/data_access/account/data/datasources/local/app_database.dart';
import 'package:cuban_seller/data_access/account/domain/entities/account.dart';
import 'package:cuban_seller/data_access/account/domain/repositories/account_repository.dart';
import 'package:cuban_seller/data_access/account/domain/usecases/insert_account_usecases.dart';
import 'package:cuban_seller/data_access/account/domain/usecases/update_account_usecases.dart';

class AccountRepositoryImplement implements AccountRepository {
  final AppDatabase _appDatabase;

  AccountRepositoryImplement(this._appDatabase);

  @override
  Future<bool> deleteAccount(int id) {
    return _appDatabase
        .deleteAccount(id)
        .then((value) => true)
        .catchError((_) => false);
  }

  @override
  Future<List<Account>> getAccounts() {
    return _appDatabase.allAccounts;
  }

  @override
  Future<Account?> insertAccount(InsertAccountParam account) async {
    return await _appDatabase.insertAccount(account);
  }

  @override
  Future<Account?> updateAccount(int id, UpdateAccountParam account) async {
    return await _appDatabase.updateAccount(id, account);
  }

  @override
  Future<List<Account>> getAccountsByName(String name) {
    return _appDatabase.getAccountsByName(name);
  }
}

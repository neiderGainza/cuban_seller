import 'package:cuban_seller/features/account/domain/entities/account.dart';
import 'package:cuban_seller/features/account/domain/usecases/insert_account_usecases.dart';
import 'package:cuban_seller/features/account/domain/usecases/update_account_usecases.dart';

abstract class AccountRepository {
  Future<Account?> insertAccount(InsertAccountParam account);
  Future<Account?> updateAccount(int id, UpdateAccountParam account);
  Future<bool> deleteAccount(int id);
  Future<List<Account>> getAccounts();
}

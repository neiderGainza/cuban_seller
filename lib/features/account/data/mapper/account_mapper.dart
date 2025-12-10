import 'package:cuban_seller/features/account/data/datasources/local/app_database.dart';
import 'package:cuban_seller/features/account/domain/entities/account.dart';
import 'package:cuban_seller/features/account/domain/entities/coin.dart';
import 'package:cuban_seller/features/account/domain/usecases/insert_account_usecases.dart';
import 'package:cuban_seller/features/account/domain/usecases/update_account_usecases.dart';
import 'package:drift/drift.dart';

class AccountMapper {
  static Account toEntity(AccountModelData row) {
    return Account(
      id: row.id,
      name: row.name,
      amount: row.amount,
      coin: Coin(value: row.coinValue),
    );
  }

  static AccountModelCompanion toCompanionFromInsertParam(
    InsertAccountParam param,
  ) {
    return AccountModelCompanion.insert(
      name: param.name,
      amount: param.amount,
      coinValue: param.coin.value,
    );
  }

  static AccountModelCompanion toCompanionFromUpdateParam(
    int id,
    UpdateAccountParam param,
  ) {
    return AccountModelCompanion(
      name: Value(param.name!),
      amount: Value(param.amount!),
      coinValue: Value(param.coin!.value),
    );
  }
}

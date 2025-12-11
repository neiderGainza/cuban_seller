import 'package:cuban_seller/data_access/account/data/datasources/local/app_database.dart';
import 'package:cuban_seller/data_access/account/domain/entities/account.dart';
import 'package:cuban_seller/data_access/account/domain/entities/coin.dart';
import 'package:cuban_seller/data_access/account/domain/usecases/insert_account_usecases.dart';
import 'package:cuban_seller/data_access/account/domain/usecases/update_account_usecases.dart';
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
      id: Value(id),
      name: param.name != null ? Value(param.name!) : const Value.absent(),
      amount: param.amount != null
          ? Value(param.amount!)
          : const Value.absent(),
      coinValue: param.coin != null
          ? Value(param.coin!.value)
          : const Value.absent(),
    );
  }
}

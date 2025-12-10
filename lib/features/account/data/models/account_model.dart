import 'package:drift/drift.dart';
import 'coin_model.dart';

class AccountModel extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 50)();

  RealColumn get amount => real()();

  TextColumn get coinValue => text().references(CoinModel, #value)();

  DateTimeColumn get createdAt => dateTime().nullable()();

  DateTimeColumn get updatedAt => dateTime().nullable()();
}

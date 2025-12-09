import 'package:drift/drift.dart';

class CoinModel extends Table {
  TextColumn get value => text().withLength(min: 0, max: 15)();

  DateTimeColumn get createdAt => dateTime().nullable()();

  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {value};
}

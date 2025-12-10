// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CoinModelTable extends CoinModel
    with TableInfo<$CoinModelTable, CoinModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CoinModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 15,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [value, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'coin_model';
  @override
  VerificationContext validateIntegrity(
    Insertable<CoinModelData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {value};
  @override
  CoinModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CoinModelData(
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $CoinModelTable createAlias(String alias) {
    return $CoinModelTable(attachedDatabase, alias);
  }
}

class CoinModelData extends DataClass implements Insertable<CoinModelData> {
  final String value;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const CoinModelData({required this.value, this.createdAt, this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['value'] = Variable<String>(value);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  CoinModelCompanion toCompanion(bool nullToAbsent) {
    return CoinModelCompanion(
      value: Value(value),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory CoinModelData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CoinModelData(
      value: serializer.fromJson<String>(json['value']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'value': serializer.toJson<String>(value),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  CoinModelData copyWith({
    String? value,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => CoinModelData(
    value: value ?? this.value,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  CoinModelData copyWithCompanion(CoinModelCompanion data) {
    return CoinModelData(
      value: data.value.present ? data.value.value : this.value,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CoinModelData(')
          ..write('value: $value, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(value, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CoinModelData &&
          other.value == this.value &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CoinModelCompanion extends UpdateCompanion<CoinModelData> {
  final Value<String> value;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const CoinModelCompanion({
    this.value = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CoinModelCompanion.insert({
    required String value,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : value = Value(value);
  static Insertable<CoinModelData> custom({
    Expression<String>? value,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (value != null) 'value': value,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CoinModelCompanion copyWith({
    Value<String>? value,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return CoinModelCompanion(
      value: value ?? this.value,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CoinModelCompanion(')
          ..write('value: $value, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AccountModelTable extends AccountModel
    with TableInfo<$AccountModelTable, AccountModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _coinValueMeta = const VerificationMeta(
    'coinValue',
  );
  @override
  late final GeneratedColumn<String> coinValue = GeneratedColumn<String>(
    'coin_value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES coin_model (value)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    amount,
    coinValue,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account_model';
  @override
  VerificationContext validateIntegrity(
    Insertable<AccountModelData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('coin_value')) {
      context.handle(
        _coinValueMeta,
        coinValue.isAcceptableOrUnknown(data['coin_value']!, _coinValueMeta),
      );
    } else if (isInserting) {
      context.missing(_coinValueMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AccountModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountModelData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      coinValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}coin_value'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $AccountModelTable createAlias(String alias) {
    return $AccountModelTable(attachedDatabase, alias);
  }
}

class AccountModelData extends DataClass
    implements Insertable<AccountModelData> {
  final int id;
  final String name;
  final double amount;
  final String coinValue;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const AccountModelData({
    required this.id,
    required this.name,
    required this.amount,
    required this.coinValue,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['amount'] = Variable<double>(amount);
    map['coin_value'] = Variable<String>(coinValue);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  AccountModelCompanion toCompanion(bool nullToAbsent) {
    return AccountModelCompanion(
      id: Value(id),
      name: Value(name),
      amount: Value(amount),
      coinValue: Value(coinValue),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory AccountModelData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountModelData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      amount: serializer.fromJson<double>(json['amount']),
      coinValue: serializer.fromJson<String>(json['coinValue']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'amount': serializer.toJson<double>(amount),
      'coinValue': serializer.toJson<String>(coinValue),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  AccountModelData copyWith({
    int? id,
    String? name,
    double? amount,
    String? coinValue,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => AccountModelData(
    id: id ?? this.id,
    name: name ?? this.name,
    amount: amount ?? this.amount,
    coinValue: coinValue ?? this.coinValue,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  AccountModelData copyWithCompanion(AccountModelCompanion data) {
    return AccountModelData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      amount: data.amount.present ? data.amount.value : this.amount,
      coinValue: data.coinValue.present ? data.coinValue.value : this.coinValue,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccountModelData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('amount: $amount, ')
          ..write('coinValue: $coinValue, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, amount, coinValue, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountModelData &&
          other.id == this.id &&
          other.name == this.name &&
          other.amount == this.amount &&
          other.coinValue == this.coinValue &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class AccountModelCompanion extends UpdateCompanion<AccountModelData> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> amount;
  final Value<String> coinValue;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  const AccountModelCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.amount = const Value.absent(),
    this.coinValue = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  AccountModelCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double amount,
    required String coinValue,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       amount = Value(amount),
       coinValue = Value(coinValue);
  static Insertable<AccountModelData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? amount,
    Expression<String>? coinValue,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (amount != null) 'amount': amount,
      if (coinValue != null) 'coin_value': coinValue,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  AccountModelCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<double>? amount,
    Value<String>? coinValue,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return AccountModelCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      coinValue: coinValue ?? this.coinValue,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (coinValue.present) {
      map['coin_value'] = Variable<String>(coinValue.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountModelCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('amount: $amount, ')
          ..write('coinValue: $coinValue, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CoinModelTable coinModel = $CoinModelTable(this);
  late final $AccountModelTable accountModel = $AccountModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [coinModel, accountModel];
}

typedef $$CoinModelTableCreateCompanionBuilder =
    CoinModelCompanion Function({
      required String value,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $$CoinModelTableUpdateCompanionBuilder =
    CoinModelCompanion Function({
      Value<String> value,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

final class $$CoinModelTableReferences
    extends BaseReferences<_$AppDatabase, $CoinModelTable, CoinModelData> {
  $$CoinModelTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AccountModelTable, List<AccountModelData>>
  _accountModelRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.accountModel,
    aliasName: $_aliasNameGenerator(
      db.coinModel.value,
      db.accountModel.coinValue,
    ),
  );

  $$AccountModelTableProcessedTableManager get accountModelRefs {
    final manager = $$AccountModelTableTableManager($_db, $_db.accountModel)
        .filter(
          (f) => f.coinValue.value.sqlEquals($_itemColumn<String>('value')!),
        );

    final cache = $_typedResult.readTableOrNull(_accountModelRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CoinModelTableFilterComposer
    extends Composer<_$AppDatabase, $CoinModelTable> {
  $$CoinModelTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> accountModelRefs(
    Expression<bool> Function($$AccountModelTableFilterComposer f) f,
  ) {
    final $$AccountModelTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.value,
      referencedTable: $db.accountModel,
      getReferencedColumn: (t) => t.coinValue,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountModelTableFilterComposer(
            $db: $db,
            $table: $db.accountModel,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CoinModelTableOrderingComposer
    extends Composer<_$AppDatabase, $CoinModelTable> {
  $$CoinModelTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CoinModelTableAnnotationComposer
    extends Composer<_$AppDatabase, $CoinModelTable> {
  $$CoinModelTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> accountModelRefs<T extends Object>(
    Expression<T> Function($$AccountModelTableAnnotationComposer a) f,
  ) {
    final $$AccountModelTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.value,
      referencedTable: $db.accountModel,
      getReferencedColumn: (t) => t.coinValue,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AccountModelTableAnnotationComposer(
            $db: $db,
            $table: $db.accountModel,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CoinModelTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CoinModelTable,
          CoinModelData,
          $$CoinModelTableFilterComposer,
          $$CoinModelTableOrderingComposer,
          $$CoinModelTableAnnotationComposer,
          $$CoinModelTableCreateCompanionBuilder,
          $$CoinModelTableUpdateCompanionBuilder,
          (CoinModelData, $$CoinModelTableReferences),
          CoinModelData,
          PrefetchHooks Function({bool accountModelRefs})
        > {
  $$CoinModelTableTableManager(_$AppDatabase db, $CoinModelTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CoinModelTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CoinModelTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CoinModelTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> value = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CoinModelCompanion(
                value: value,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String value,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CoinModelCompanion.insert(
                value: value,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CoinModelTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({accountModelRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (accountModelRefs) db.accountModel],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (accountModelRefs)
                    await $_getPrefetchedData<
                      CoinModelData,
                      $CoinModelTable,
                      AccountModelData
                    >(
                      currentTable: table,
                      referencedTable: $$CoinModelTableReferences
                          ._accountModelRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CoinModelTableReferences(
                            db,
                            table,
                            p0,
                          ).accountModelRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.coinValue == item.value,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CoinModelTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CoinModelTable,
      CoinModelData,
      $$CoinModelTableFilterComposer,
      $$CoinModelTableOrderingComposer,
      $$CoinModelTableAnnotationComposer,
      $$CoinModelTableCreateCompanionBuilder,
      $$CoinModelTableUpdateCompanionBuilder,
      (CoinModelData, $$CoinModelTableReferences),
      CoinModelData,
      PrefetchHooks Function({bool accountModelRefs})
    >;
typedef $$AccountModelTableCreateCompanionBuilder =
    AccountModelCompanion Function({
      Value<int> id,
      required String name,
      required double amount,
      required String coinValue,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$AccountModelTableUpdateCompanionBuilder =
    AccountModelCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<double> amount,
      Value<String> coinValue,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$AccountModelTableReferences
    extends
        BaseReferences<_$AppDatabase, $AccountModelTable, AccountModelData> {
  $$AccountModelTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CoinModelTable _coinValueTable(_$AppDatabase db) =>
      db.coinModel.createAlias(
        $_aliasNameGenerator(db.accountModel.coinValue, db.coinModel.value),
      );

  $$CoinModelTableProcessedTableManager get coinValue {
    final $_column = $_itemColumn<String>('coin_value')!;

    final manager = $$CoinModelTableTableManager(
      $_db,
      $_db.coinModel,
    ).filter((f) => f.value.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_coinValueTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AccountModelTableFilterComposer
    extends Composer<_$AppDatabase, $AccountModelTable> {
  $$AccountModelTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CoinModelTableFilterComposer get coinValue {
    final $$CoinModelTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.coinValue,
      referencedTable: $db.coinModel,
      getReferencedColumn: (t) => t.value,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CoinModelTableFilterComposer(
            $db: $db,
            $table: $db.coinModel,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AccountModelTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountModelTable> {
  $$AccountModelTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CoinModelTableOrderingComposer get coinValue {
    final $$CoinModelTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.coinValue,
      referencedTable: $db.coinModel,
      getReferencedColumn: (t) => t.value,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CoinModelTableOrderingComposer(
            $db: $db,
            $table: $db.coinModel,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AccountModelTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountModelTable> {
  $$AccountModelTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$CoinModelTableAnnotationComposer get coinValue {
    final $$CoinModelTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.coinValue,
      referencedTable: $db.coinModel,
      getReferencedColumn: (t) => t.value,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CoinModelTableAnnotationComposer(
            $db: $db,
            $table: $db.coinModel,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AccountModelTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AccountModelTable,
          AccountModelData,
          $$AccountModelTableFilterComposer,
          $$AccountModelTableOrderingComposer,
          $$AccountModelTableAnnotationComposer,
          $$AccountModelTableCreateCompanionBuilder,
          $$AccountModelTableUpdateCompanionBuilder,
          (AccountModelData, $$AccountModelTableReferences),
          AccountModelData,
          PrefetchHooks Function({bool coinValue})
        > {
  $$AccountModelTableTableManager(_$AppDatabase db, $AccountModelTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountModelTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountModelTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountModelTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> coinValue = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => AccountModelCompanion(
                id: id,
                name: name,
                amount: amount,
                coinValue: coinValue,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required double amount,
                required String coinValue,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => AccountModelCompanion.insert(
                id: id,
                name: name,
                amount: amount,
                coinValue: coinValue,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AccountModelTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({coinValue = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (coinValue) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.coinValue,
                                referencedTable: $$AccountModelTableReferences
                                    ._coinValueTable(db),
                                referencedColumn: $$AccountModelTableReferences
                                    ._coinValueTable(db)
                                    .value,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AccountModelTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AccountModelTable,
      AccountModelData,
      $$AccountModelTableFilterComposer,
      $$AccountModelTableOrderingComposer,
      $$AccountModelTableAnnotationComposer,
      $$AccountModelTableCreateCompanionBuilder,
      $$AccountModelTableUpdateCompanionBuilder,
      (AccountModelData, $$AccountModelTableReferences),
      AccountModelData,
      PrefetchHooks Function({bool coinValue})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CoinModelTableTableManager get coinModel =>
      $$CoinModelTableTableManager(_db, _db.coinModel);
  $$AccountModelTableTableManager get accountModel =>
      $$AccountModelTableTableManager(_db, _db.accountModel);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AccountTable extends Account with TableInfo<$AccountTable, AccountData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountTable(this.attachedDatabase, [this._alias]);
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
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<AccountType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<AccountType>($AccountTable.$convertertype);
  static const VerificationMeta _currencyMeta = const VerificationMeta(
    'currency',
  );
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('€'),
  );
  static const VerificationMeta _initialBalanceMeta = const VerificationMeta(
    'initialBalance',
  );
  @override
  late final GeneratedColumn<double> initialBalance = GeneratedColumn<double>(
    'initial_balance',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _colorHexMeta = const VerificationMeta(
    'colorHex',
  );
  @override
  late final GeneratedColumn<String> colorHex = GeneratedColumn<String>(
    'color_hex',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('4280391411'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    type,
    currency,
    initialBalance,
    isArchived,
    colorHex,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account';
  @override
  VerificationContext validateIntegrity(
    Insertable<AccountData> instance, {
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
    if (data.containsKey('currency')) {
      context.handle(
        _currencyMeta,
        currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta),
      );
    }
    if (data.containsKey('initial_balance')) {
      context.handle(
        _initialBalanceMeta,
        initialBalance.isAcceptableOrUnknown(
          data['initial_balance']!,
          _initialBalanceMeta,
        ),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('color_hex')) {
      context.handle(
        _colorHexMeta,
        colorHex.isAcceptableOrUnknown(data['color_hex']!, _colorHexMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AccountData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: $AccountTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      )!,
      initialBalance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}initial_balance'],
      )!,
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      colorHex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color_hex'],
      )!,
    );
  }

  @override
  $AccountTable createAlias(String alias) {
    return $AccountTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AccountType, String, String> $convertertype =
      const EnumNameConverter<AccountType>(AccountType.values);
}

class AccountData extends DataClass implements Insertable<AccountData> {
  final int id;
  final String name;
  final AccountType type;
  final String currency;
  final double initialBalance;
  final bool isArchived;
  final String colorHex;
  const AccountData({
    required this.id,
    required this.name,
    required this.type,
    required this.currency,
    required this.initialBalance,
    required this.isArchived,
    required this.colorHex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    {
      map['type'] = Variable<String>($AccountTable.$convertertype.toSql(type));
    }
    map['currency'] = Variable<String>(currency);
    map['initial_balance'] = Variable<double>(initialBalance);
    map['is_archived'] = Variable<bool>(isArchived);
    map['color_hex'] = Variable<String>(colorHex);
    return map;
  }

  AccountCompanion toCompanion(bool nullToAbsent) {
    return AccountCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      currency: Value(currency),
      initialBalance: Value(initialBalance),
      isArchived: Value(isArchived),
      colorHex: Value(colorHex),
    );
  }

  factory AccountData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: $AccountTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      currency: serializer.fromJson<String>(json['currency']),
      initialBalance: serializer.fromJson<double>(json['initialBalance']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      colorHex: serializer.fromJson<String>(json['colorHex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(
        $AccountTable.$convertertype.toJson(type),
      ),
      'currency': serializer.toJson<String>(currency),
      'initialBalance': serializer.toJson<double>(initialBalance),
      'isArchived': serializer.toJson<bool>(isArchived),
      'colorHex': serializer.toJson<String>(colorHex),
    };
  }

  AccountData copyWith({
    int? id,
    String? name,
    AccountType? type,
    String? currency,
    double? initialBalance,
    bool? isArchived,
    String? colorHex,
  }) => AccountData(
    id: id ?? this.id,
    name: name ?? this.name,
    type: type ?? this.type,
    currency: currency ?? this.currency,
    initialBalance: initialBalance ?? this.initialBalance,
    isArchived: isArchived ?? this.isArchived,
    colorHex: colorHex ?? this.colorHex,
  );
  AccountData copyWithCompanion(AccountCompanion data) {
    return AccountData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      currency: data.currency.present ? data.currency.value : this.currency,
      initialBalance: data.initialBalance.present
          ? data.initialBalance.value
          : this.initialBalance,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      colorHex: data.colorHex.present ? data.colorHex.value : this.colorHex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccountData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('currency: $currency, ')
          ..write('initialBalance: $initialBalance, ')
          ..write('isArchived: $isArchived, ')
          ..write('colorHex: $colorHex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    type,
    currency,
    initialBalance,
    isArchived,
    colorHex,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountData &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.currency == this.currency &&
          other.initialBalance == this.initialBalance &&
          other.isArchived == this.isArchived &&
          other.colorHex == this.colorHex);
}

class AccountCompanion extends UpdateCompanion<AccountData> {
  final Value<int> id;
  final Value<String> name;
  final Value<AccountType> type;
  final Value<String> currency;
  final Value<double> initialBalance;
  final Value<bool> isArchived;
  final Value<String> colorHex;
  const AccountCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.currency = const Value.absent(),
    this.initialBalance = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.colorHex = const Value.absent(),
  });
  AccountCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required AccountType type,
    this.currency = const Value.absent(),
    this.initialBalance = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.colorHex = const Value.absent(),
  }) : name = Value(name),
       type = Value(type);
  static Insertable<AccountData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? currency,
    Expression<double>? initialBalance,
    Expression<bool>? isArchived,
    Expression<String>? colorHex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (currency != null) 'currency': currency,
      if (initialBalance != null) 'initial_balance': initialBalance,
      if (isArchived != null) 'is_archived': isArchived,
      if (colorHex != null) 'color_hex': colorHex,
    });
  }

  AccountCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<AccountType>? type,
    Value<String>? currency,
    Value<double>? initialBalance,
    Value<bool>? isArchived,
    Value<String>? colorHex,
  }) {
    return AccountCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      currency: currency ?? this.currency,
      initialBalance: initialBalance ?? this.initialBalance,
      isArchived: isArchived ?? this.isArchived,
      colorHex: colorHex ?? this.colorHex,
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
    if (type.present) {
      map['type'] = Variable<String>(
        $AccountTable.$convertertype.toSql(type.value),
      );
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (initialBalance.present) {
      map['initial_balance'] = Variable<double>(initialBalance.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (colorHex.present) {
      map['color_hex'] = Variable<String>(colorHex.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('currency: $currency, ')
          ..write('initialBalance: $initialBalance, ')
          ..write('isArchived: $isArchived, ')
          ..write('colorHex: $colorHex')
          ..write(')'))
        .toString();
  }
}

class $CategoryTable extends Category
    with TableInfo<$CategoryTable, CategoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryTable(this.attachedDatabase, [this._alias]);
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
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<CategoryType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<CategoryType>($CategoryTable.$convertertype);
  static const VerificationMeta _colorHexMeta = const VerificationMeta(
    'colorHex',
  );
  @override
  late final GeneratedColumn<String> colorHex = GeneratedColumn<String>(
    'color_hex',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('4280391411'),
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, type, colorHex, icon];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryData> instance, {
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
    if (data.containsKey('color_hex')) {
      context.handle(
        _colorHexMeta,
        colorHex.isAcceptableOrUnknown(data['color_hex']!, _colorHexMeta),
      );
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: $CategoryTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      colorHex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color_hex'],
      )!,
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      ),
    );
  }

  @override
  $CategoryTable createAlias(String alias) {
    return $CategoryTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<CategoryType, String, String> $convertertype =
      const EnumNameConverter<CategoryType>(CategoryType.values);
}

class CategoryData extends DataClass implements Insertable<CategoryData> {
  final int id;
  final String name;
  final CategoryType type;
  final String colorHex;
  final String? icon;
  const CategoryData({
    required this.id,
    required this.name,
    required this.type,
    required this.colorHex,
    this.icon,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    {
      map['type'] = Variable<String>($CategoryTable.$convertertype.toSql(type));
    }
    map['color_hex'] = Variable<String>(colorHex);
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    return map;
  }

  CategoryCompanion toCompanion(bool nullToAbsent) {
    return CategoryCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      colorHex: Value(colorHex),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
    );
  }

  factory CategoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: $CategoryTable.$convertertype.fromJson(
        serializer.fromJson<String>(json['type']),
      ),
      colorHex: serializer.fromJson<String>(json['colorHex']),
      icon: serializer.fromJson<String?>(json['icon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(
        $CategoryTable.$convertertype.toJson(type),
      ),
      'colorHex': serializer.toJson<String>(colorHex),
      'icon': serializer.toJson<String?>(icon),
    };
  }

  CategoryData copyWith({
    int? id,
    String? name,
    CategoryType? type,
    String? colorHex,
    Value<String?> icon = const Value.absent(),
  }) => CategoryData(
    id: id ?? this.id,
    name: name ?? this.name,
    type: type ?? this.type,
    colorHex: colorHex ?? this.colorHex,
    icon: icon.present ? icon.value : this.icon,
  );
  CategoryData copyWithCompanion(CategoryCompanion data) {
    return CategoryData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      colorHex: data.colorHex.present ? data.colorHex.value : this.colorHex,
      icon: data.icon.present ? data.icon.value : this.icon,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('colorHex: $colorHex, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, type, colorHex, icon);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryData &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.colorHex == this.colorHex &&
          other.icon == this.icon);
}

class CategoryCompanion extends UpdateCompanion<CategoryData> {
  final Value<int> id;
  final Value<String> name;
  final Value<CategoryType> type;
  final Value<String> colorHex;
  final Value<String?> icon;
  const CategoryCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.icon = const Value.absent(),
  });
  CategoryCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required CategoryType type,
    this.colorHex = const Value.absent(),
    this.icon = const Value.absent(),
  }) : name = Value(name),
       type = Value(type);
  static Insertable<CategoryData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? colorHex,
    Expression<String>? icon,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (colorHex != null) 'color_hex': colorHex,
      if (icon != null) 'icon': icon,
    });
  }

  CategoryCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<CategoryType>? type,
    Value<String>? colorHex,
    Value<String?>? icon,
  }) {
    return CategoryCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      colorHex: colorHex ?? this.colorHex,
      icon: icon ?? this.icon,
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
    if (type.present) {
      map['type'] = Variable<String>(
        $CategoryTable.$convertertype.toSql(type.value),
      );
    }
    if (colorHex.present) {
      map['color_hex'] = Variable<String>(colorHex.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('colorHex: $colorHex, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AccountTable account = $AccountTable(this);
  late final $CategoryTable category = $CategoryTable(this);
  late final AccountDao accountDao = AccountDao(this as AppDatabase);
  late final CategoryDao categoryDao = CategoryDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [account, category];
}

typedef $$AccountTableCreateCompanionBuilder =
    AccountCompanion Function({
      Value<int> id,
      required String name,
      required AccountType type,
      Value<String> currency,
      Value<double> initialBalance,
      Value<bool> isArchived,
      Value<String> colorHex,
    });
typedef $$AccountTableUpdateCompanionBuilder =
    AccountCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<AccountType> type,
      Value<String> currency,
      Value<double> initialBalance,
      Value<bool> isArchived,
      Value<String> colorHex,
    });

class $$AccountTableFilterComposer
    extends Composer<_$AppDatabase, $AccountTable> {
  $$AccountTableFilterComposer({
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

  ColumnWithTypeConverterFilters<AccountType, AccountType, String> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get initialBalance => $composableBuilder(
    column: $table.initialBalance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AccountTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountTable> {
  $$AccountTableOrderingComposer({
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

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get initialBalance => $composableBuilder(
    column: $table.initialBalance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AccountTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountTable> {
  $$AccountTableAnnotationComposer({
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

  GeneratedColumnWithTypeConverter<AccountType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<double> get initialBalance => $composableBuilder(
    column: $table.initialBalance,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<String> get colorHex =>
      $composableBuilder(column: $table.colorHex, builder: (column) => column);
}

class $$AccountTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AccountTable,
          AccountData,
          $$AccountTableFilterComposer,
          $$AccountTableOrderingComposer,
          $$AccountTableAnnotationComposer,
          $$AccountTableCreateCompanionBuilder,
          $$AccountTableUpdateCompanionBuilder,
          (
            AccountData,
            BaseReferences<_$AppDatabase, $AccountTable, AccountData>,
          ),
          AccountData,
          PrefetchHooks Function()
        > {
  $$AccountTableTableManager(_$AppDatabase db, $AccountTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<AccountType> type = const Value.absent(),
                Value<String> currency = const Value.absent(),
                Value<double> initialBalance = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<String> colorHex = const Value.absent(),
              }) => AccountCompanion(
                id: id,
                name: name,
                type: type,
                currency: currency,
                initialBalance: initialBalance,
                isArchived: isArchived,
                colorHex: colorHex,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required AccountType type,
                Value<String> currency = const Value.absent(),
                Value<double> initialBalance = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<String> colorHex = const Value.absent(),
              }) => AccountCompanion.insert(
                id: id,
                name: name,
                type: type,
                currency: currency,
                initialBalance: initialBalance,
                isArchived: isArchived,
                colorHex: colorHex,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AccountTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AccountTable,
      AccountData,
      $$AccountTableFilterComposer,
      $$AccountTableOrderingComposer,
      $$AccountTableAnnotationComposer,
      $$AccountTableCreateCompanionBuilder,
      $$AccountTableUpdateCompanionBuilder,
      (AccountData, BaseReferences<_$AppDatabase, $AccountTable, AccountData>),
      AccountData,
      PrefetchHooks Function()
    >;
typedef $$CategoryTableCreateCompanionBuilder =
    CategoryCompanion Function({
      Value<int> id,
      required String name,
      required CategoryType type,
      Value<String> colorHex,
      Value<String?> icon,
    });
typedef $$CategoryTableUpdateCompanionBuilder =
    CategoryCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<CategoryType> type,
      Value<String> colorHex,
      Value<String?> icon,
    });

class $$CategoryTableFilterComposer
    extends Composer<_$AppDatabase, $CategoryTable> {
  $$CategoryTableFilterComposer({
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

  ColumnWithTypeConverterFilters<CategoryType, CategoryType, String> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CategoryTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoryTable> {
  $$CategoryTableOrderingComposer({
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

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colorHex => $composableBuilder(
    column: $table.colorHex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoryTable> {
  $$CategoryTableAnnotationComposer({
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

  GeneratedColumnWithTypeConverter<CategoryType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get colorHex =>
      $composableBuilder(column: $table.colorHex, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);
}

class $$CategoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoryTable,
          CategoryData,
          $$CategoryTableFilterComposer,
          $$CategoryTableOrderingComposer,
          $$CategoryTableAnnotationComposer,
          $$CategoryTableCreateCompanionBuilder,
          $$CategoryTableUpdateCompanionBuilder,
          (
            CategoryData,
            BaseReferences<_$AppDatabase, $CategoryTable, CategoryData>,
          ),
          CategoryData,
          PrefetchHooks Function()
        > {
  $$CategoryTableTableManager(_$AppDatabase db, $CategoryTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<CategoryType> type = const Value.absent(),
                Value<String> colorHex = const Value.absent(),
                Value<String?> icon = const Value.absent(),
              }) => CategoryCompanion(
                id: id,
                name: name,
                type: type,
                colorHex: colorHex,
                icon: icon,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required CategoryType type,
                Value<String> colorHex = const Value.absent(),
                Value<String?> icon = const Value.absent(),
              }) => CategoryCompanion.insert(
                id: id,
                name: name,
                type: type,
                colorHex: colorHex,
                icon: icon,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CategoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoryTable,
      CategoryData,
      $$CategoryTableFilterComposer,
      $$CategoryTableOrderingComposer,
      $$CategoryTableAnnotationComposer,
      $$CategoryTableCreateCompanionBuilder,
      $$CategoryTableUpdateCompanionBuilder,
      (
        CategoryData,
        BaseReferences<_$AppDatabase, $CategoryTable, CategoryData>,
      ),
      CategoryData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AccountTableTableManager get account =>
      $$AccountTableTableManager(_db, _db.account);
  $$CategoryTableTableManager get category =>
      $$CategoryTableTableManager(_db, _db.category);
}

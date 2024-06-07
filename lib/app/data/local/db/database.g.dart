// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorNearMeDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$NearMeDatabaseBuilder databaseBuilder(String name) =>
      _$NearMeDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$NearMeDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$NearMeDatabaseBuilder(null);
}

class _$NearMeDatabaseBuilder {
  _$NearMeDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$NearMeDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$NearMeDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<NearMeDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$NearMeDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$NearMeDatabase extends NearMeDatabase {
  _$NearMeDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PlaceHistoryDao? _placeDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PlaceEntity` (`placeId` TEXT NOT NULL, `name` TEXT NOT NULL, `rating` REAL NOT NULL, `imageUrl` TEXT NOT NULL, `totalReviewNum` INTEGER NOT NULL, PRIMARY KEY (`placeId`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PlaceHistoryDao get placeDao {
    return _placeDaoInstance ??= _$PlaceHistoryDao(database, changeListener);
  }
}

class _$PlaceHistoryDao extends PlaceHistoryDao {
  _$PlaceHistoryDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _placeHistoryEntityInsertionAdapter = InsertionAdapter(
            database,
            'PlaceEntity',
            (PlaceHistoryEntity item) => <String, Object?>{
                  'placeId': item.placeId,
                  'name': item.name,
                  'rating': item.rating,
                  'imageUrl': item.imageUrl,
                  'totalReviewNum': item.totalReviewNum
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PlaceHistoryEntity>
      _placeHistoryEntityInsertionAdapter;

  @override
  Future<List<PlaceHistoryEntity>> findAllPlaceList() async {
    return _queryAdapter.queryList('SELECT * FROM PlaceEntity',
        mapper: (Map<String, Object?> row) => PlaceHistoryEntity(
            row['placeId'] as String,
            row['name'] as String,
            row['rating'] as double,
            row['imageUrl'] as String,
            row['totalReviewNum'] as int));
  }

  @override
  Future<void> nukeTable() async {
    await _queryAdapter.queryNoReturn('DELETE FROM PlaceEntity');
  }

  @override
  Future<void> insertPlaceEntity(PlaceHistoryEntity placeEntity) async {
    await _placeHistoryEntityInsertionAdapter.insert(
        placeEntity, OnConflictStrategy.abort);
  }
}

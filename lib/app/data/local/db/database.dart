
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:nearme/app/data/local/db/dao/place_history_dao.dart';
import 'package:nearme/app/data/local/db/entity/place_history_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [PlaceHistoryEntity])
abstract class NearMeDatabase extends FloorDatabase {
  PlaceHistoryDao get placeDao;

}

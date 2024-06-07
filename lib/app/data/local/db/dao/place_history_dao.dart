
import 'package:floor/floor.dart';

import '../entity/place_history_entity.dart';

@dao
abstract class PlaceHistoryDao {
  @Query('SELECT * FROM PlaceEntity')
  Future<List<PlaceHistoryEntity>> findAllPlaceList();

  @insert
  Future<void> insertPlaceEntity(PlaceHistoryEntity placeEntity);

  @Query('DELETE FROM PlaceEntity')
  Future<void> nukeTable();

}
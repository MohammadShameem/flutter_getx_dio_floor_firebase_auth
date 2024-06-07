
import 'package:floor/floor.dart';

@Entity(tableName: 'PlaceEntity')
class PlaceHistoryEntity{
  @PrimaryKey()
  final String placeId;
  final String name;
  final double rating;
  final String imageUrl;
  final int totalReviewNum;

  PlaceHistoryEntity(this.placeId, this.name, this.rating, this.imageUrl,
      this.totalReviewNum);
}
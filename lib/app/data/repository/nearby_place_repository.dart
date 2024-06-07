
import '../model/apiresponse/placelist/nearby_place_apiresponse.dart';
import '../model/apiresponse/placelist/nearby_place_query_param.dart';

abstract class NearbyPlaceRepository{
  Future<NearbyPlaceApiResponse> nearbyPlaceList(
      NearbyPlaceQueryParam queryParam);
}
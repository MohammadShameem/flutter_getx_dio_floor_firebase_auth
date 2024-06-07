
import 'package:nearme/app/data/model/apiresponse/placelist/nearby_place_query_param.dart';

import '../model/apiresponse/placelist/nearby_place_apiresponse.dart';

abstract class NearbyPlaceRemoteDataSource{
  Future<NearbyPlaceApiResponse> nearbyPlaceList(
      NearbyPlaceQueryParam queryParam);
}
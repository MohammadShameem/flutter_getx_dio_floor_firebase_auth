
import 'package:get/get.dart';
import 'package:nearme/app/data/model/apiresponse/placelist/nearby_place_apiresponse.dart';

import 'package:nearme/app/data/model/apiresponse/placelist/nearby_place_query_param.dart';
import 'package:nearme/app/data/remote/nearby_place_remote_data_source.dart';

import '../remote/nearby_place_data_source_impl.dart';
import 'nearby_place_repository.dart';

class NearbyPlaceRepositoryImpl implements NearbyPlaceRepository {
  final NearbyPlaceRemoteDataSource _remoteDataSource =
      Get.put(NearbyPlaceRemoteDataSourceImpl());

  @override
  Future<NearbyPlaceApiResponse> nearbyPlaceList(NearbyPlaceQueryParam queryParam) {
    return _remoteDataSource.nearbyPlaceList(queryParam);
  }

}
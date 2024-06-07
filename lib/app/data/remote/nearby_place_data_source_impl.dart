
import 'package:nearme/app/core/base/base_remote_source.dart';
import 'package:nearme/app/data/model/apiresponse/placelist/nearby_place_apiresponse.dart';
import 'package:nearme/app/network/dio_provider.dart';

import '../model/apiresponse/placelist/nearby_place_query_param.dart';
import 'nearby_place_remote_data_source.dart';

class NearbyPlaceRemoteDataSourceImpl extends BaseRemoteSource implements NearbyPlaceRemoteDataSource{
  @override
  Future<NearbyPlaceApiResponse> nearbyPlaceList(
      NearbyPlaceQueryParam queryParam) {
    var endpoint = "${DioProvider.baseUrl}place/nearbysearch/json";
    var dioCall = dioClient.get(endpoint,queryParameters: queryParam.toJson());
    try{
      return callApiWithErrorParser(dioCall)
          .then((response) =>
          NearbyPlaceApiResponse.fromJson(response));
    }catch(e){
      rethrow;
    }
  }

}
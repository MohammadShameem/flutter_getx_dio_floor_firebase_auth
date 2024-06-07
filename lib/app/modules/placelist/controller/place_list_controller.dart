
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:nearme/app/core/base/base_controller.dart';
import 'package:nearme/app/data/model/apiresponse/placelist/nearby_place_apiresponse.dart';
import 'package:nearme/app/data/model/apiresponse/placelist/nearby_place_query_param.dart';
import 'package:nearme/app/data/repository/nearby_place_repository.dart';
import 'package:nearme/app/data/repository/nearby_place_repository_impl.dart';
import '../model/nearby_ui_data.dart';

class PlaceListController extends BaseController{
  final NearbyPlaceRepository _repository =
      Get.put(NearbyPlaceRepositoryImpl());

  final RxList<NearbyPlaceUiData> _placeListController = RxList.empty();
  List<NearbyPlaceUiData> get placeList => _placeListController.toList();

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;

  @override
  void onInit() {
    //getNearbyPlaceList();
    collectionReference = firebaseFirestore.collection("nearby_place");
    _placeListController.bindStream(readNearbyPlaceList());
    super.onInit();
  }

  ///Read data from firestore
  Stream<List<NearbyPlaceUiData>> readNearbyPlaceList() {
    return collectionReference.snapshots().map((event) =>
      event.docs.map((e) => NearbyPlaceUiData.fromMap(e)).toList()
    );
  }


  ///API Call for nearby place list
  void getNearbyPlaceList(){
    var queryParam = NearbyPlaceQueryParam(
      location:"-33.8670522%2C151.1957362",
      type:"restaurant",
      keyword:"cruise"
    );
    callDataService(
      _repository.nearbyPlaceList(queryParam),
      onSuccess:_handleNearbyPlaceListResponseSuccess
    );
  }

  void _handleNearbyPlaceListResponseSuccess(NearbyPlaceApiResponse response){

  }

}

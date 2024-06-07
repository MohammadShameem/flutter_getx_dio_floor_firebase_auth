
import 'package:get/get.dart';
import 'package:nearme/app/data/local/db/database.dart';
import 'package:nearme/app/data/local/db/entity/place_history_entity.dart';
import 'package:nearme/app/modules/placelist/model/nearby_ui_data.dart';

class PlaceDetailsController extends GetxController{
  final Rx<NearbyPlaceUiData> _nearbyPlaceUiData = NearbyPlaceUiData().obs;
  NearbyPlaceUiData get nearbyPlaceUiData => _nearbyPlaceUiData.value;

  @override
  void onInit() {
    showDetailsPageData();
    super.onInit();
  }

  void showDetailsPageData(){
    var arg = Get.arguments;
    if(arg is NearbyPlaceUiData){
      _nearbyPlaceUiData(
          NearbyPlaceUiData(
              name: arg.name ?? "",
              imageUrl: arg.imageUrl ?? "",
              rating: arg.rating ?? 0.0,
              totalReviews: arg.totalReviews ?? 0 ,
              isOpen: arg.isOpen ?? false,
              address: arg.address ?? "",
              phone: arg.phone ?? "",
              placeId: arg.placeId
          )
      );
      checkPlaceHistoryDatabase(arg);
    }
  }

  Future<void> checkPlaceHistoryDatabase(NearbyPlaceUiData arg) async{
    final database = await $FloorNearMeDatabase.databaseBuilder('flutter_database.db')
        .build();
    var placeHistoryDao = database.placeDao;
    final history = PlaceHistoryEntity(
        arg.placeId??'',arg.name??'',arg.rating??0.0,arg.imageUrl??'',arg.totalReviews??0
    );
    await placeHistoryDao.insertPlaceEntity(history);

  }





}
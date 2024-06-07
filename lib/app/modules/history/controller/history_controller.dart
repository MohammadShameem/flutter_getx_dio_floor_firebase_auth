
import 'package:get/get.dart';
import 'package:nearme/app/data/local/db/database.dart';
import '../../../data/local/db/entity/place_history_entity.dart';

class HistoryController extends GetxController{
 // final NearMeDatabase _database= Get.find();

  final RxList<PlaceHistoryEntity> _placeHistoryListController = RxList.empty();
  List<PlaceHistoryEntity> get placeList => _placeHistoryListController.toList();

  @override
  void onInit() {
    getAllPlaceHistoryList();
    super.onInit();
  }

  Future<void> getAllPlaceHistoryList() async{
    final database = await $FloorNearMeDatabase
        .databaseBuilder('flutter_database.db')
        .build();
    var placeListDao = database.placeDao;
    var placeList = await placeListDao.findAllPlaceList();
    _placeHistoryListController(placeList);
    print("Place List: ${placeList.toString()} Size:${placeList.length}");
  }

}
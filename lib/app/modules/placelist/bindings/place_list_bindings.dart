
import 'package:get/get.dart';
import 'package:nearme/app/modules/placelist/controller/place_list_controller.dart';

class PlaceListBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PlaceListController>(() => PlaceListController());
  }

}
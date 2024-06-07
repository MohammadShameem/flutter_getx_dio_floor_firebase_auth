
import 'package:get/get.dart';
import 'package:nearme/app/modules/placedetails/controller/place_details_controller.dart';

class PlaceDetailsBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PlaceDetailsController>(() => PlaceDetailsController());
  }

}
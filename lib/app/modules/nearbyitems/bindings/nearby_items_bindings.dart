
import 'package:get/get.dart';

import '../controller/nearby_items_controller.dart';

class NearbyItemsBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<NearbyItemsController>(() => NearbyItemsController());
  }

}
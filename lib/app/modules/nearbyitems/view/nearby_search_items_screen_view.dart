
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearme/app/modules/nearbyitems/controller/nearby_items_controller.dart';
import 'nearby_item_search_grid_view.dart';

class NearbyItemsView extends GetView<NearbyItemsController> {
     NearbyItemsView({super.key});
     final nearbyItemsController = Get.put(NearbyItemsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nearby Items'),
        ),
        body: NearbyItemGridView( nearbyItemsList:
          nearbyItemsController.nearbyItemsList
        )
    );
  }
}




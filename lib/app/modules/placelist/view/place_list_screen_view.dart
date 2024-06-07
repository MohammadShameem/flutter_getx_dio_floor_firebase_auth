import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nearme/app/core/base/base_view.dart';
import 'package:nearme/app/modules/placelist/controller/place_list_controller.dart';
import 'package:nearme/app/modules/placelist/view/place_list_grid_view.dart';
import '../../../core/widget/custom_app_bar.dart';
import '../../../core/widget/loading.dart';
import 'custom_search_delegate.dart';

class PlaceListView extends GetView<PlaceListController>{
    PlaceListView({super.key});
  final placeListController = Get.put(PlaceListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Nearby Place List'),
          actions: [
            IconButton(
              onPressed: () {
                if(placeListController.placeList.isNotEmpty){
                  showSearch(
                      context: context,
                      // delegate to customize the search bar
                      delegate: CustomSearchDelegate( nearbyPlaceList: placeListController.placeList)
                  );
                }
              },
              icon: const Icon(Icons.search),
            )
          ]
        ),
      body: Center(
        child: Obx(() => _getView()),
      ),
    );
  }

  Widget _getView() {
    return placeListController.placeList.isEmpty?
        const Loading():
        PlaceListGridView(placeList: placeListController.placeList);
  }



}




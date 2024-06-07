
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearme/app/core/widget/loading.dart';
import 'package:nearme/app/modules/history/controller/history_controller.dart';
import 'package:nearme/app/modules/history/view/history_grid_view.dart';

import '../../placelist/view/place_list_grid_view.dart';

class HistoryView extends GetView<HistoryController>{
   HistoryView({super.key});
   var historyController = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('History'),
        ),
      body: Center(
        child: Obx(() => _getView()),
      ),
    );
  }

  Widget _getView() {
    return  historyController.placeList.isEmpty?
        const Text("Data not found!"):
    HistoryGridView(placeHistoryList: historyController.placeList);
       
  }

}


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nearme/app/modules/placedetails/view/place_details_screen_view.dart';
import 'package:nearme/app/modules/placelist/view/place_list_item.dart';
import 'package:nearme/app/modules/placelist/view/place_list_screen_view.dart';

import '../../../data/local/db/entity/place_history_entity.dart';
import 'history_item.dart';

class HistoryGridView extends StatelessWidget {
   HistoryGridView({
    Key? key,
    required this.placeHistoryList
  }) : super(key: key);

   List<PlaceHistoryEntity> placeHistoryList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal:10),
      itemCount: placeHistoryList.length,
      itemBuilder:(context,index){
        return GestureDetector(
          onTap: () =>{
           // Get.to( const PlaceDetailsView())
          },
          child: HistoryItem(placeHistoryList: placeHistoryList,
            index: index,),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 5,
        mainAxisExtent: 260,
      ),
    );
  }
}
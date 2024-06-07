

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nearme/app/modules/placedetails/view/place_details_screen_view.dart';
import 'package:nearme/app/modules/placelist/view/place_list_item.dart';

import '../model/nearby_ui_data.dart';

class PlaceListGridView extends StatelessWidget {
   PlaceListGridView({
     super.key,
     required this.placeList,
   });

   List<NearbyPlaceUiData> placeList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal:10),
      itemCount: placeList.length,
      itemBuilder:(context,index){
        return GestureDetector(
          onTap: () =>{ Get.to(() => PlaceDetailsView(),
              arguments: placeList[index])
          },
          child: PlaceListItem(placeList:placeList,index: index,),
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


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../placelist/view/place_list_screen_view.dart';
import 'nearby_search_item.dart';

class NearbyItemGridView extends StatelessWidget {
  NearbyItemGridView({
    Key? key,
    required this.nearbyItemsList
  }) : super(key: key);
  List<String> nearbyItemsList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal:10),
      itemCount: nearbyItemsList.length,
      itemBuilder: (ctx, index) {
        return GestureDetector(
          onTap: () =>{ Get.to( PlaceListView())},
          child: NearbySearchItem(nearbyItemsList: nearbyItemsList,index: index),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        mainAxisExtent: 120,
      ),
    );
  }
}
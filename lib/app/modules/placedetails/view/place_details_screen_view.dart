import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:nearme/app/modules/placedetails/controller/place_details_controller.dart';

class PlaceDetailsView extends GetView<PlaceDetailsController> {
   PlaceDetailsView({super.key});
   final placeListController = Get.put(PlaceDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Place Details'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              showPlaceImage(),
              titleSection(),
              phoneCall(),
              Column(
                children: [
                  const SizedBox(height: 20.0),
                  buildRatingReviewText("Rating", placeListController.nearbyPlaceUiData.rating.toString()),
                  const SizedBox(height: 5.0),
                  buildRatingReviewText("Reviews", placeListController.nearbyPlaceUiData.totalReviews.toString()),
                  const SizedBox(height: 40.0),
                  showRating(),
                  const SizedBox(height: 40.0),
                  buttonMapDirection(),
                ],
              ),
            ],
          ),
        ));
  }

  Widget buildRatingReviewText(String title, String value) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16,0,16,0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                fontSize: 20,
              )),
          Text(value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget buttonMapDirection() {
    return SizedBox(
      width: 300.0,
      height: 40.0,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
          ),
          onPressed: () {},
          child: const Text(
            'Map Directions',
            style: TextStyle(color: Colors.white, fontSize: 18),
          )),
    );
  }

  Widget showRating() {
    return RatingBarIndicator(
      rating: placeListController.nearbyPlaceUiData.rating??0.0,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: 40.0,
      direction: Axis.horizontal,
    );
  }

  Widget showPlaceImage() {
    return SizedBox(
        width: double.infinity,
        height: 200,
        child: CachedNetworkImage(
        imageUrl: placeListController.nearbyPlaceUiData.imageUrl??"",
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => Image.asset('assets/ic_default_image.png'),
        fit: BoxFit.fill,
      )
    );
  }

  Widget phoneCall() {
    return ListTile(
        title: const Text("Phone Number",
            style: TextStyle(
              fontSize: 18,
            )),
        subtitle: Text(placeListController.nearbyPlaceUiData.phone!,
            style:  const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            )
        ),
        leading: const CircleAvatar(
          backgroundColor: Color(0xff94d500),
          radius: 30,
          child: Icon(
            Icons.phone,
            color: Colors.white,
          ),
        ));
  }

   Widget titleSection() {
    return  Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(placeListController.nearbyPlaceUiData.name!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text( placeListController.nearbyPlaceUiData.address!,
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

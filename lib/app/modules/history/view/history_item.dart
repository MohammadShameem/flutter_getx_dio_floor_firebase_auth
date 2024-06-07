
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../data/local/db/entity/place_history_entity.dart';

class HistoryItem extends StatelessWidget {
   HistoryItem({
    Key? key,
     required this.placeHistoryList,
     required this.index
  }) : super(key: key);

  List<PlaceHistoryEntity> placeHistoryList;
  int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 260,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
        ),
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            _showPlaceImage(),
            const SizedBox(height: 5.0),
            Text(placeHistoryList[index].name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            _showReviewRating()
          ],
        ),
      ),
    );
  }

  Widget _showReviewRating() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(placeHistoryList[index].rating.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              _showRatingBarIndicator(),
              Text('(${placeHistoryList[index].totalReviewNum})',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          );
  }

  Widget _showRatingBarIndicator() {
    return RatingBarIndicator(
              rating: placeHistoryList[index].rating,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 20.0,
              direction: Axis.horizontal,
            );
  }

  Widget _showPlaceImage() {
    return CachedNetworkImage(
      imageUrl: placeHistoryList[index].imageUrl,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) =>
          Image.asset('assets/ic_default_image.png'),
    );
  }
}
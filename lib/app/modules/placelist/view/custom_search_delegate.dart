import 'package:flutter/material.dart';
import 'package:nearme/app/modules/placelist/view/place_list_grid_view.dart';

import '../model/nearby_ui_data.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate({
    required this.nearbyPlaceList
    });
  // Demo list to show querying
  List<NearbyPlaceUiData> nearbyPlaceList;

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {

    List<NearbyPlaceUiData> matchQuery = [];
    for (var placeItem in nearbyPlaceList) {
      if (placeItem.name!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(placeItem);
      }
    }
    return  PlaceListGridView(placeList: matchQuery);
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<NearbyPlaceUiData> matchQuery = [];
    for (var placeItem in nearbyPlaceList) {
      if (placeItem.name!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(placeItem);
      }
    }
    return  PlaceListGridView(placeList: matchQuery);
  }
}

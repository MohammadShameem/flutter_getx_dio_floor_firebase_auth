
class NearbyPlaceApiResponse{
  List<NearbyPlace> nearbyList = [];
  NearbyPlaceApiResponse(this.nearbyList);
  NearbyPlaceApiResponse.fromJson(dynamic json) {
    if (json['results'] != null) {
      nearbyList = [];
      json['results'].forEach((v) {
        nearbyList.add(NearbyPlace.fromJson(v));
      });
    }
  }
}

class NearbyPlace {
  NearbyPlace({
      String? name, 
      String? placeId, 
      num? rating, 
      num? userRatingsTotal, 
      String? vicinity,}){
    _name = name;
    _placeId = placeId;
    _rating = rating;
    _userRatingsTotal = userRatingsTotal;
    _vicinity = vicinity;
}

  NearbyPlace.fromJson(dynamic json) {
    _name = json['name'];
    _placeId = json['place_id'];
    _rating = json['rating'];
    _userRatingsTotal = json['user_ratings_total'];
    _vicinity = json['vicinity'];
  }
  String? _name;
  String? _placeId;
  num? _rating;
  num? _userRatingsTotal;
  String? _vicinity;
  String? get name => _name;
  String? get placeId => _placeId;
  num? get rating => _rating;
  num? get userRatingsTotal => _userRatingsTotal;
  String? get vicinity => _vicinity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['place_id'] = _placeId;
    map['rating'] = _rating;
    map['user_ratings_total'] = _userRatingsTotal;
    map['vicinity'] = _vicinity;
    return map;
  }
}
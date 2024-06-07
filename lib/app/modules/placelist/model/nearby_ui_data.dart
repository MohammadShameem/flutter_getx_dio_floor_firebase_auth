import 'package:cloud_firestore/cloud_firestore.dart';

class NearbyPlaceUiData {
  String? name;
  double? rating;
  String? imageUrl;
  String? location;
  String? phone;
  String? address;
  String? type;
  bool? isOpen;
  int? totalReviews;
  String? placeId;

  NearbyPlaceUiData({
    this.name = "" ,
    this.type = "",
    this.imageUrl = "",
    this.rating = 0.0,
    this.location = "",
    this.phone = "",
    this.address = "",
    this.isOpen = false,
    this.totalReviews = 0,
    this.placeId = "",
  });

  NearbyPlaceUiData.fromMap(DocumentSnapshot data){
    name = data["name"];
    rating = data["rating"];
    imageUrl = data["imageUrl"];
    location = data["location"];
    phone = data["phone"];
    address = data["address"];
    isOpen = data["isOpen"];
    totalReviews = data["reviews"];
    type = data["type"];
    placeId = data["placeId"];
  }

}
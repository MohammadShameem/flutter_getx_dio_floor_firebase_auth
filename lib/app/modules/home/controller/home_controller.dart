
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:location/location.dart';
import 'package:nearme/app/core/base/base_controller.dart';
import 'package:nearme/app/core/base/base_google_sign_in.dart';
import 'package:nearme/app/modules/sociallogin/view/social_login_screen_view.dart';

import '../view/home_screen_view.dart';

class HomeController extends GetxController{
  Location location = Location();

  final _locationController = ''.obs;
  String get locationLatLng => _locationController.value;
  setLocation(String latLng) => _locationController(latLng);

  @override onInit(){
    checkGPSIsEnable();
    super.onInit();
  }

  Future<bool?> requestToEnableGPS() async{
    bool isLocationServiceEnable = await location.serviceEnabled();
    if (!isLocationServiceEnable) { //if device is off
       return await location.requestService();
    }else {
      getLocationFromGPS();
    }
    return null;
  }

  Future<void> checkGPSIsEnable() async{
    bool? isGpsEnable = await requestToEnableGPS();
    if (isGpsEnable != null && isGpsEnable) {
      getLocationFromGPS();
      print("GPS device is turned ON");
    }
  }

  Future<void> getLocationFromGPS() async{
    var locationData = await location.getLocation();
    setLocation("${locationData.latitude},${locationData.longitude}");
  }


  @override
  void onClose() {}



}
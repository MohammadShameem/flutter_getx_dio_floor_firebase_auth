
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nearme/app/core/base/base_controller.dart';
import 'package:nearme/app/data/local/db/database.dart';
import 'package:nearme/app/modules/sociallogin/controller/social_login_controller.dart';
import 'package:nearme/app/modules/splash/controller/splash_controller.dart';

import '../../sociallogin/view/social_login_screen_view.dart';

class SettingController extends BaseController{
  static const platform = MethodChannel('com.bjit.flutter.nearme/battery');

  final _batteryLevel = ''.obs;
  String get batteryLevel => _batteryLevel.value;


  @override onInit(){
    _getBatteryLevel();
    super.onInit();
  }

  Future<void> _getBatteryLevel() async {
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      _batteryLevel('Battery level at $result %');
    } on PlatformException catch (e) {
      _batteryLevel("Failed to get battery level: '${e.message}'.");
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        deleteTable();
        Get.offAll(()=> SocialLoginView());
      }
    });
  }

  Future<void> deleteTable() async{
    final database = await $FloorNearMeDatabase.databaseBuilder('flutter_database.db')
        .build();
    var placeHistoryDao = database.placeDao;
    await placeHistoryDao.nukeTable();

  }




}
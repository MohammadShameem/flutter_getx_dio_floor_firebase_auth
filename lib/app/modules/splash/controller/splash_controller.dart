
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nearme/app/modules/home/view/home_screen_view.dart';
import 'package:nearme/app/modules/sociallogin/view/social_login_screen_view.dart';

class SplashController extends GetxController{

  @override
  void onReady() {
    isUserLoggedIn();
    super.onReady();
  }

  void isUserLoggedIn(){
    if(FirebaseAuth.instance.currentUser != null){
      Get.off(()=>HomeView());
    }else{
      Get.offAll(()=>SocialLoginView());
    }
  }

}
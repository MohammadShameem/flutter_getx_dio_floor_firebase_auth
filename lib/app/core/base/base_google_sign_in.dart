

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../modules/home/view/home_screen_view.dart';
import '../../modules/sociallogin/view/social_login_screen_view.dart';

class BaseSocialSignInController extends GetxController{

  ///Google SignIn
  late GoogleSignIn googleSign;
  var isSignIn = false.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  ///Google Sign In onReady
  @override
  void onReady() async {
    googleSign = GoogleSignIn();
    firebaseAuthState();
    super.onReady();
  }

  Future<void> firebaseAuthState() async {
    ever(isSignIn, handleAuthStateChanged);
    isSignIn.value = await firebaseAuth.currentUser != null;
    firebaseAuth.authStateChanges().listen((event) {
      isSignIn.value = event != null;
    });

  }


  ///Google Sign In when button click
  void googleSignIn() async {
    GoogleSignInAccount? googleSignInAccount =
    await googleSign.signIn();
    if (googleSignInAccount != null) {
      GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      await firebaseAuth.signInWithCredential(oAuthCredential);
    }
    else {
      Get.snackbar("Error!", "Somethings went wrong.");
    }
  }

  ///Facebook sign in
  void signInWithFacebook() async {
     try{
       LoginResult result = await FacebookAuth.instance.login();
       if(result.status == LoginStatus.success){
         final AuthCredential facebookCredential =
         FacebookAuthProvider.credential(result.accessToken!.token);
         await firebaseAuth.signInWithCredential(facebookCredential);
         Get.snackbar("Success!", "Logged In");
       }
       else{
         Get.snackbar("Error!", "Somethings went wrong.");
       }
     } on Exception catch(_){
       Get.snackbar("Error!", "Somethings went wrong.");
     }

  }


  ///Auth State firebase
  void handleAuthStateChanged(isLoggedIn) {
    if (isLoggedIn) {
      Get.off(()=> HomeView(), arguments: firebaseAuth.currentUser);
    } else {
      Get.off(()=> SocialLoginView());
    }
  }

}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearme/app/modules/home/view/home_screen_view.dart';
import 'package:nearme/app/modules/sociallogin/controller/social_login_controller.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class SocialLoginView extends GetView<SocialLoginController>{
   SocialLoginView({super.key});
  var socialController = Get.put(SocialLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Login'),
      ),
      body: _buildContainer(context)

    );
  }

  Widget _buildContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Image(image: AssetImage('assets/nearme_logo.png'),
                    height: 80, width: 80,),
              const SizedBox(height: 20),
              const Text("Social Sign In",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 50),
              SocialLoginButton(
                buttonType: SocialLoginButtonType.google,
                onPressed: () {
                  controller.googleSignIn();
                },
              ),
              const SizedBox(height: 30),
              SocialLoginButton(
                buttonType: SocialLoginButtonType.facebook,
                onPressed: () {
                  controller.signInWithFacebook();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

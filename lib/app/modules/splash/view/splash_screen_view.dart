

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:nearme/app/core/widget/loading.dart';
import 'package:nearme/app/modules/splash/controller/splash_controller.dart';

class SplashView extends GetView<SplashController>{
   SplashView({super.key});
  var splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  getView(context)
    );

  }

  Widget getView(BuildContext context){
    return Container(
        color: Colors.white,
        child:Image(image: const AssetImage('assets/nearme_logo.png'),
          height: MediaQuery.of(context).size.height),
      );
  }

}
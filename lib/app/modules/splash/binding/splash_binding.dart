
import 'package:get/get.dart';
import 'package:nearme/app/modules/splash/controller/splash_controller.dart';

class SplashBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }

}
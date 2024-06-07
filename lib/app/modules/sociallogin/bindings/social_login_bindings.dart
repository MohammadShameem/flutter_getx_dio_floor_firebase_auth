
import 'package:get/get.dart';
import 'package:nearme/app/modules/sociallogin/controller/social_login_controller.dart';

class SocialLoginBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<SocialLoginController>(() => SocialLoginController());
  }

}

import 'package:get/get.dart';
import 'package:nearme/app/modules/settings/controller/setting_binding_controller.dart';

class SettingBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(() => SettingController());
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearme/app/core/base/base_view.dart';
import 'package:nearme/app/modules/settings/controller/setting_binding_controller.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingView extends GetView<SettingController> {
  SettingView({super.key});
 var settingController = Get.put(SettingController());
 var about = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Setting'),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() =>
                      settingController.batteryLevel.isNotEmpty?
                      Text(settingController.batteryLevel,
                          style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)):
                      const Text('Getting Batter level...',
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      )
                    ),
                    const SizedBox(height: 20),
                    buttonAbout(),
                    const SizedBox(height: 20),
                  /*  buttonProfile(),
                    const SizedBox(height: 40),*/
                    buttonLogout(),

                  ],
                )
            )
        )
    );
  }

  Widget buttonLogout() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(), padding: const EdgeInsets.all(12)),
      onPressed: () {
        controller.logout();
      },
      child: const Text(
        'Logout',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  Widget buttonProfile() {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(padding: const EdgeInsets.all(12)),
        onPressed: ()  {

        },
        child: const Text(
          'User Profile',
          style: TextStyle(color: Colors.blue, fontSize: 18),
        )
    );
  }

  Future<String> getPackage() async {
    var packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String version = packageInfo.version;
    return "App Name : $appName\n App Version: $version";
  }

  void openDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('About APP'),
        content: Text(about),
        actions: [
          TextButton(
            child: const Text("Close"),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }


  Widget buttonAbout() {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(padding: const EdgeInsets.all(12)),
        onPressed: () async {
          about = await getPackage();
          openDialog();
        },
        child: const Text(
          'About App',
          style: TextStyle(color: Colors.blue, fontSize: 18),
        ));
  }
}

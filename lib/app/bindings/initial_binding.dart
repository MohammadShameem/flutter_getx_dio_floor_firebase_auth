import 'package:get/get.dart';
import 'package:nearme/app/bindings/remote_source_bindings.dart';
import 'package:nearme/app/bindings/repository_bindings.dart';
import 'package:nearme/app/data/local/db/database.dart';
import 'package:nearme/app/modules/history/bindings/history_binding.dart';
import 'package:nearme/app/modules/home/bindings/home_binding.dart';
import 'package:nearme/app/modules/nearbyitems/bindings/nearby_items_bindings.dart';
import 'package:nearme/app/modules/placedetails/bindings/place_details_bindings.dart';
import 'package:nearme/app/modules/placedetails/view/place_details_screen_view.dart';
import 'package:nearme/app/modules/placelist/bindings/place_list_bindings.dart';
import 'package:nearme/app/modules/sociallogin/bindings/social_login_bindings.dart';
import 'local_source_bindings.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    RepositoryBindings().dependencies();
    RemoteSourceBindings().dependencies();
    LocalSourceBindings().dependencies();
  }
}

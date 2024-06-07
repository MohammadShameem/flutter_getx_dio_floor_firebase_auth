
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:nearme/app/modules/history/bindings/history_binding.dart';
import 'package:nearme/app/modules/history/view/history_screen_view.dart';
import 'package:nearme/app/modules/home/bindings/home_binding.dart';
import 'package:nearme/app/modules/home/view/home_screen_view.dart';
import 'package:nearme/app/modules/nearbyitems/view/nearby_search_items_screen_view.dart';
import 'package:nearme/app/modules/placedetails/bindings/place_details_bindings.dart';
import 'package:nearme/app/modules/placedetails/view/place_details_screen_view.dart';
import 'package:nearme/app/modules/placelist/bindings/place_list_bindings.dart';
import 'package:nearme/app/modules/placelist/view/place_list_screen_view.dart';
import 'package:nearme/app/modules/settings/bindings/setting_bindings.dart';
import 'package:nearme/app/modules/settings/view/setting_screen_view.dart';
import 'package:nearme/app/modules/sociallogin/bindings/social_login_bindings.dart';
import 'package:nearme/app/modules/sociallogin/view/social_login_screen_view.dart';
import 'package:nearme/app/modules/splash/binding/splash_binding.dart';
import 'package:nearme/app/modules/splash/view/splash_screen_view.dart';
import 'package:nearme/app/routes/app_routes.dart';
import '../modules/nearbyitems/bindings/nearby_items_bindings.dart';

class AppPages{
  AppPages._();
  static const INITIAL = Routes.SPLASH;

  static final routes = [

    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
      binding: SplashBindings()
    ),

    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBindings()
    ),

    GetPage(
      name: Routes.NEAR_BY_ITEMS,
      page: () => NearbyItemsView(),
      binding: NearbyItemsBindings()
    ),

    GetPage(
      name: Routes.PLACE_LIST,
      page: () => PlaceListView(),
      binding: PlaceListBindings()
    ),

    GetPage(
      name: Routes.PLACE_DETAILS,
      page: () => PlaceDetailsView(),
      binding: PlaceDetailsBindings()
    ),

    GetPage(
      name: Routes.SOCIAL_LOGIN,
      page: () => SocialLoginView(),
      binding: SocialLoginBindings()
    ),

    GetPage(
        name: Routes.HISTORY,
        page: () => HistoryView(),
        binding: HistoryBinding()
    ),

    GetPage(
        name: Routes.SETTING,
        page: () => SettingView(),
        binding: SettingBindings()
    )

  ];
}
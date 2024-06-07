
import 'package:get/get.dart';
import 'package:nearme/app/data/repository/nearby_place_repository_impl.dart';
import 'package:nearme/app/data/repository/nearby_place_repository.dart';

class RepositoryBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<NearbyPlaceRepository>(() =>
      NearbyPlaceRepositoryImpl(),
      tag: (NearbyPlaceRepository).toString()
    );
  }

}
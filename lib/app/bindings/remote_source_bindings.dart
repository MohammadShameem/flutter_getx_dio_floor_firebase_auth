
import 'package:get/get.dart';
import 'package:nearme/app/data/remote/nearby_place_remote_data_source.dart';
import 'package:nearme/app/data/remote/nearby_place_data_source_impl.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NearbyPlaceRemoteDataSource>(
          () => NearbyPlaceRemoteDataSourceImpl(),
      tag: (NearbyPlaceRemoteDataSource).toString(),
    );
  }
}


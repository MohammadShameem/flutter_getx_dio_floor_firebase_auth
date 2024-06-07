import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearme/app/core/widget/loading.dart';
import 'package:nearme/app/modules/history/view/history_screen_view.dart';
import 'package:nearme/app/modules/home/controller/home_controller.dart';
import 'package:nearme/app/modules/nearbyitems/view/nearby_search_items_screen_view.dart';
import 'package:nearme/app/modules/settings/view/setting_screen_view.dart';
import 'nearby_item_autocomplete_text.dart';

class HomeView extends GetView<HomeController> {
   HomeView({super.key});
   var homeController = Get.put(HomeController());
  var latLng ="";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Search Nearby item'),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Get.to(() => SettingView());
                },
              ),
            ],
          ),
          body: Obx(()=>
              getView()
          )
      ),
    );
  }

  Widget getView(){
    return homeController.locationLatLng.isEmpty? const Center(
      child: Loading(),
    ):
      SingleChildScrollView(
        child:  Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Image(image: AssetImage('assets/nearme_logo.png'),
                height: 80, width: 80,),
              const SizedBox(height: 20),
              const Text("Search Nearby Item",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 100),
              const NearbyItemAutocompleteText(),
              const SizedBox(height: 50),
              _showButtons(),
              //Text(controller.locationLatLng)
            ],
          ),
        ),
      ) ;
  }

   Widget _showButtons() {
    return Row(
        children:[
           OutlinedButton(
              onPressed: () {
                Get.to( HistoryView());
              },
              child: const Text('Search History'),
          ),
          const SizedBox(width: 10),
          OutlinedButton(
              onPressed: () {
                Get.to(NearbyItemsView());
              },
              child: const Text('Nearby Items')
          ),
        ],
      );
  }
}


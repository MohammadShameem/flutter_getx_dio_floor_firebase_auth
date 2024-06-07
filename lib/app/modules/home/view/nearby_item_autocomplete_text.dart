
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearme/app/modules/nearbyitems/view/nearby_search_items_screen_view.dart';

class NearbyItemAutocompleteText extends StatelessWidget {
  const NearbyItemAutocompleteText({super.key});

  static const List<String> _nearbyItemOptions = [
    'restaurant','fuel station','gas station','car wash','pharmacy','hospital','doctor','hotel','cafe','supermarket',
    'department store','bank','mosque','park', 'parking','bus station','tax stand','train station','beauty salon',
    'hair care','car dealer','car rental','car repair','book store','bakery','drugstore',
    'electrician','electronics store','hardware store','fire station','police','post office',
    'stadium', 'airport','embassy','travel agency'];

  static String _displayStringForOption(String option) => option;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      displayStringForOption: _displayStringForOption,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _nearbyItemOptions.where((String option) {
          return option
              .toString()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        return showNearbyItemSearch(textEditingController, focusNode, onFieldSubmitted);
      },
      onSelected: (String selection) {
        debugPrint('You just selected ${_displayStringForOption(selection)}');
        Get.to(NearbyItemsView());
      },
    );
  }

  TextFormField showNearbyItemSearch(TextEditingController textEditingController,
      FocusNode focusNode, VoidCallback onFieldSubmitted) {
    return TextFormField(
        controller: textEditingController,
        decoration: inputSearchStyle(),
        focusNode: focusNode,
        onFieldSubmitted: (String value) {
          onFieldSubmitted();
          print('You just typed a new entry  $value');
        },
      );
  }

  InputDecoration inputSearchStyle() {
    return const InputDecoration(
        filled: true,
        fillColor: Color(0xFFFFFFFF),
        prefixIcon: Icon(Icons.search, color: Colors.pink),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        hintText: 'ex: restaurant',
      );
  }
}
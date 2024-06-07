import 'package:flutter/material.dart';



class NearbySearchItem extends StatelessWidget {
  const NearbySearchItem({
    Key? key,
    required this.nearbyItemsList,
    required this.index
  }) : super(key: key);

  final List<String> nearbyItemsList;
  final index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:  [
                const Image(image: AssetImage('assets/ic_local_cafe.png'),
                  height: 40, width: 40,),
                const SizedBox(height: 10),
                Center(
                    child: Text(nearbyItemsList[index],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
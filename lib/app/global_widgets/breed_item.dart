import 'package:dog_breeds/app/global_widgets/fade_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class BreedItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final bool cameFromFavourites;
  final int count;
  BreedItem(
      {@required this.imageUrl,
      @required this.name,
      this.cameFromFavourites = false,
      this.count = -1});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed("/breed_images",
          arguments: [name, cameFromFavourites, count]),
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Align(
          child: Column(
            children: [
              FadeNetworkImage(imageUrl: imageUrl),
              Text(
                name,
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

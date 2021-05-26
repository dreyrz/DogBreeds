import 'package:dog_breeds/app/core/utils/adapt.dart';
import 'package:dog_breeds/app/core/utils/strings.dart';
import 'package:dog_breeds/app/global_widgets/fade_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'breed_images_controller.dart';

class BreedImagesPage extends GetView<BreedImagesController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            Strings.breed + ": " + Get.arguments[0],
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(color: Colors.white),
          ),
          actions: [
            if (!Get.arguments[1])
              Obx(
                () => IconButton(
                  icon: Icon(Icons.favorite,
                      color: controller.favourite == true
                          ? Colors.red
                          : Colors.black),
                  onPressed: () async => await controller.addFavourite(),
                ),
              ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
          child: grid(controller),
        ),
      ),
    );
  }
}

Widget grid(BreedImagesController controller) {
  return SizedBox(
    height: Adapt.hp(80),
    child: controller.obx(
      (state) => GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 4,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: Get.arguments[1] ? Get.arguments[2] : state.length,
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  FadeNetworkImage(imageUrl: state[index]),
                  // GetBuilder<BreedImagesController>(
                  //   builder: (c) => IconButton(
                  //     icon: Icon(Icons.favorite,
                  //         color: c.favouritesList[index] == true
                  //             ? Colors.red
                  //             : Colors.black),
                  //     onPressed: () => c.addFavourite(index: index),
                  //   ),
                  // )
                ],
              ));
        },
      ),
      onLoading: Center(
        child: CircularProgressIndicator(),
      ),
      onEmpty: Center(
        child: Text("No data"),
      ),
      onError: (error) => Center(
        child: Text(error),
      ),
    ),
  );
}

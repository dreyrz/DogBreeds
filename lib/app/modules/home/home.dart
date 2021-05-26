import 'package:dog_breeds/app/core/utils/adapt.dart';
import 'package:dog_breeds/app/core/utils/strings.dart';
import 'package:dog_breeds/app/global_widgets/breed_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomePageController> {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  Strings.allBreeds,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
            grid(context, controller)
          ],
        ),
      ),
    );
  }
}

Widget grid(context, HomePageController controller) {
  return SizedBox(
    height: Adapt.hp(80),
    child: controller.obx(
      (state) => GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 4,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: state.length,
        itemBuilder: (context, index) {
          return Obx(
            () => controller.breedsImages.length < state.length
                ? Center(child: CircularProgressIndicator())
                : BreedItem(
                    name: state[index].name,
                    imageUrl: controller.breedsImages[index],
                  ),
          );
        },
      ),
      onLoading: Center(
        child: CircularProgressIndicator(),
      ),
      onEmpty: Center(
        child: Text(
          "No data",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      onError: (error) => Center(
        child: Text(error),
      ),
    ),
  );
}

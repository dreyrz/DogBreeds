import 'package:dog_breeds/app/core/utils/adapt.dart';
import 'package:dog_breeds/app/core/utils/strings.dart';
import 'package:dog_breeds/app/global_widgets/breed_item.dart';
import 'package:dog_breeds/app/global_widgets/fade_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'favourites_controller.dart';

class FavouritesPage extends GetView<FavouritesController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Text(
              Strings.favourites,
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
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
                          return BreedItem(
                            cameFromFavourites: true,
                            count: state[index].images.length,
                            name: state[index].breed.name,
                            imageUrl: state[index].images[0],
                          );
                        }),
                    onLoading: Center(
                      child: Text(
                        "Add a favourite",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    onEmpty: Center(
                      child: Text(
                        "No data",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    onError: (error) => Center(
                          child: Text(error),
                        )))
          ],
        ),
      ),
    );
  }
}

List<Widget> fiveImages(FavouritesController controller) {
  List<Widget> list = [];
  list.addAll(
    controller.fiveImages.map(
      (e) => FadeNetworkImage(imageUrl: e),
    ),
  );

  return list;
}

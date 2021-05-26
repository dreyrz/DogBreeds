import 'dart:convert';

import 'package:dog_breeds/app/data/repository/breed_images_repository.dart';
import 'package:dog_breeds/app/modules/favourites/favourites_controller.dart';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BreedImagesController extends GetxController
    with StateMixin<List<String>> {
  final BreedImagesRepository repository;
  BreedImagesController({@required this.repository})
      : assert(repository != null);
  final favouritesController = Get.put(FavouritesController());
  List<String> breedImagesUrls = [].cast<String>();
  final _favourite = false.obs;
  get favourite => this._favourite.value;
  set favourite(value) => this._favourite.value = value;
  @override
  void onInit() {
    getAllBreedImages(breed: Get.arguments[0]);
    super.onInit();
  }

  Future getAllBreedImages({@required String breed}) async {
    if (favouritesController.favouritesBreeds.contains(Get.arguments[0])) {
      favourite = true;
    }
    final data = await repository.getBreedImages(breed: breed);

    data.forEach((breed) async {
      breedImagesUrls.add(breed);
    });

    if (breedImagesUrls.isEmpty) {
      change(breedImagesUrls, status: RxStatus.empty());
    } else {
      change(breedImagesUrls, status: RxStatus.success());
    }
  }

  addFavourite() async {
    favourite = !favourite;
    update();
    final box = GetStorage();
    if (favourite) {
      favouritesController.favouritesBreeds.add(Get.arguments[0]);
      final jsonFavouriteBreeds =
          jsonEncode(favouritesController.favouritesBreeds);

      box.write("favouriteBreeds", jsonFavouriteBreeds);
    } else {
      favouritesController.favouritesBreeds.remove(Get.arguments[0]);
      final jsonFavouriteBreeds =
          jsonEncode(favouritesController.favouritesBreeds);
      box.write("favouriteBreeds", jsonFavouriteBreeds);
    }
    await favouritesController.getFiveImages();
  }
}

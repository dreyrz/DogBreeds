import 'dart:convert';

import 'package:dog_breeds/app/data/model/breed.dart';
import 'package:dog_breeds/app/data/model/favouriteBreed.dart';
import 'package:dog_breeds/app/data/repository/breed_images_repository.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FavouritesController extends GetxController
    with StateMixin<List<FavouriteBreed>> {
  final BreedImagesRepository repository;
  FavouritesController({this.repository});
  List<String> favouritesBreeds = [].cast<String>().obs;
  List<FavouriteBreed> fiveImages = [].cast<FavouriteBreed>();
  @override
  void onInit() async {
    initializeBreeds();
    super.onInit();
  }

  initializeBreeds() {
    final box = GetStorage();
    final List jsonDecodedFavouriteBreeds =
        jsonDecode(box.read("favouriteBreeds"));

    jsonDecodedFavouriteBreeds.forEach((element) {
      favouritesBreeds.add(element);
    });
  }

  Future getFiveImages() async {
    fiveImages.clear();

    change(fiveImages, status: RxStatus.loading());
    favouritesBreeds.forEach((breed) async {
      final images = await repository.getBreedImages(breed: breed);
      final imagesFiltered = images.take(5);

      fiveImages.add(
        FavouriteBreed(
          breed: Breed(name: breed),
          images: imagesFiltered.toList(),
        ),
      );
      if (fiveImages.isEmpty || fiveImages == null) {
        change(fiveImages, status: RxStatus.empty());
      } else {
        fiveImages.sort((a, b) => a.breed.name.compareTo(b.breed.name));
        change(fiveImages, status: RxStatus.success());
      }
    });
  }
}

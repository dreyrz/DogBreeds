import 'package:dog_breeds/app/data/model/breed.dart';
import 'package:dog_breeds/app/data/repository/home_repository.dart';

import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/foundation.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class HomePageController extends GetxController with StateMixin<List<Breed>> {
  final HomeRepository repository;
  HomePageController({@required this.repository}) : assert(repository != null);

  List<Breed> breedsList = [].cast<Breed>();
  List<String> breedsImages = [].cast<String>().obs;

  @override
  void onInit() async {
    await getAllBreeds();
    super.onInit();
  }

  Future getAllBreeds() async {
    final data = await repository.getAll();
    data.keys.forEach((breed) async {
      breedsList.add(Breed(name: breed));
      final breedImageUrl = await repository.getRandomBreedImage(breed: breed);
      breedsImages.add(breedImageUrl);
    });

    if (breedsList.isEmpty) {
      change(breedsList, status: RxStatus.empty());
    } else {
      change(breedsList, status: RxStatus.success());
    }
  }
}

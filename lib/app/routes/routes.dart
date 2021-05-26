import 'package:dog_breeds/app/modules/breed_images/breed_images.dart';
import 'package:dog_breeds/app/modules/breed_images/breed_images_binding.dart';
import 'package:dog_breeds/app/modules/main_screen/main_screen._binding.dart';
import 'package:dog_breeds/app/modules/main_screen/main_screen.dart';
import 'package:get/get.dart';

class Routes {
  static final all = [
    GetPage(
      name: '/',
      page: () => MainScreenPage(),
      binding: MainScreenBinding(),
    ),
    GetPage(
      name: '/breed_images',
      page: () => BreedImagesPage(),
      binding: BreedImagesBinding(),
    ),
  ];
}

import 'package:dog_breeds/app/data/provider/api.dart';
import 'package:dog_breeds/app/data/repository/breed_images_repository.dart';
import 'package:dog_breeds/app/data/repository/home_repository.dart';
import 'package:dog_breeds/app/modules/favourites/favourites_controller.dart';
import 'package:dog_breeds/app/modules/home/home_controller.dart';

import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;

import 'main_screen_controller.dart';

class MainScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainScreenController());
    Get.lazyPut(
      () => HomePageController(
        repository: HomeRepository(
          api: Api(
            httpClient: http.Client(),
          ),
        ),
      ),
    );
    Get.lazyPut(
      () => FavouritesController(
        repository: BreedImagesRepository(
          api: Api(
            httpClient: http.Client(),
          ),
        ),
      ),
    );
  }
}

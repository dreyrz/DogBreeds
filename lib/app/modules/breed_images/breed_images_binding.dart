import 'package:dog_breeds/app/data/provider/api.dart';
import 'package:dog_breeds/app/data/repository/breed_images_repository.dart';
import 'package:dog_breeds/app/modules/breed_images/breed_images_controller.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;

class BreedImagesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => BreedImagesController(
        repository: BreedImagesRepository(
          api: Api(
            httpClient: http.Client(),
          ),
        ),
      ),
    );
  }
}

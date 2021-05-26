import 'package:dog_breeds/app/modules/favourites/favourites.dart';
import 'package:dog_breeds/app/modules/favourites/favourites_controller.dart';
import 'package:dog_breeds/app/modules/home/home.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';

class MainScreenController extends GetxController {
  final favouritesController = Get.put(FavouritesController());
  final _index = 0.obs;
  get index => this._index.value;
  set index(value) => this._index.value = value;
  final screens = [HomePage(), FavouritesPage()];
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_screen_controller.dart';

class MainScreenPage extends GetView<MainScreenController> {
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.screens[controller.index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.index,
          onTap: (index) {
            controller.index = index;
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favourites"),
          ],
        ),
      ),
    );
  }
}

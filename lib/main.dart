import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'app/core/theme/theme.dart';
import 'app/modules/main_screen/main_screen._binding.dart';
import 'app/routes/routes.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)..maxConnectionsPerHost = 5;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  runApp(
    GetMaterialApp(
        title: 'Dog Breeds',
        theme: ThemeApp.light,
        debugShowCheckedModeBanner: false,
        initialBinding: MainScreenBinding(),
        getPages: Routes.all),
  );
}

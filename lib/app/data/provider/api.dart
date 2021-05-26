import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const url = "https://dog.ceo/api";

class Api {
  final http.Client httpClient;
  static const String _listAll = "$url/breeds/list/all";

  Api({@required this.httpClient});
  Future<Map> getAllBreeds() async {
    try {
      final response = await httpClient.get(Uri.parse(_listAll));
      if (response.statusCode == 200) {
        return jsonDecode(response.body)["message"];
      }
    } catch (e) {
      print("Error on method getAllBreeds: $e");
    }
    return null;
  }

  Future<String> getRandomBreedImage({@required String breed}) async {
    try {
      final response =
          await httpClient.get(Uri.parse("$url/breed/$breed/images/random"));
      if (response.statusCode == 200) {
        return jsonDecode(response.body)["message"];
      }
    } catch (e) {
      print("Error on method getRandomBreedImage: $e");
    }
    return null;
  }

  Future<List> getBreedImages({@required String breed}) async {
    try {
      final response =
          await httpClient.get(Uri.parse("$url/breed/$breed/images"));
      if (response.statusCode == 200) {
        return jsonDecode(response.body)["message"];
      }
    } catch (e) {
      print("Error on method getBreedImages: $e");
    }
    return null;
  }
}

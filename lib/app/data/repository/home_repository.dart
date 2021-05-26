import 'package:dog_breeds/app/data/provider/api.dart';
import 'package:flutter/foundation.dart';

class HomeRepository {
  final Api api;
  HomeRepository({@required this.api}) : assert(api != null);

  Future<Map> getAll() async {
    return await api.getAllBreeds();
  }

  Future<String> getRandomBreedImage({@required breed}) async {
    return await api.getRandomBreedImage(breed: breed);
  }
}

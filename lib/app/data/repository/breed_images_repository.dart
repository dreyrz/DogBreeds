import 'package:dog_breeds/app/data/provider/api.dart';
import 'package:flutter/foundation.dart';

class BreedImagesRepository {
  final Api api;
  BreedImagesRepository({@required this.api}) : assert(api != null);

  Future<List> getBreedImages({@required breed}) async {
    return await api.getBreedImages(breed: breed);
  }
}

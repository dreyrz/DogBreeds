import 'package:dog_breeds/app/data/model/breed.dart';

class FavouriteBreed {
  Breed breed;
  List images;
  FavouriteBreed({this.breed, this.images});

  @override
  String toString() {
    return "Breed: $breed, images: ${images.length}";
  }
}

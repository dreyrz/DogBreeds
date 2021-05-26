import 'package:flutter/foundation.dart';

class Breed {
  String name;
  Breed({@required this.name});

  @override
  String toString() {
    return "name: $name";
  }
}

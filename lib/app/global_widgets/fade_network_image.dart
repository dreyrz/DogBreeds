import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class FadeNetworkImage extends StatelessWidget {
  final imageUrl;
  FadeNetworkImage({@required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: FadeInImage.memoryNetwork(
        fit: BoxFit.fill,
        placeholder: kTransparentImage,
        image: imageUrl,
      ),
    );
  }
}

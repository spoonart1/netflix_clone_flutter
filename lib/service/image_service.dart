import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageService {
  static Widget loadImage({required String imagePath}) {
    String fullPath = "https://image.tmdb.org/t/p/w500" + imagePath;
    return FadeInImage.memoryNetwork(
        placeholder: kTransparentImage, image: fullPath);
  }
}

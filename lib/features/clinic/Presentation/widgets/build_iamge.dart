import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget buildImage(String imageUrl) {
  return imageUrl.isNotEmpty
      ? CachedNetworkImage(
    imageUrl: imageUrl,
    width: double.infinity,
    fit: BoxFit.cover,


    placeholder: (context, url) => Image.asset(
      "assets/images/notAvailableImage.png",
      fit: BoxFit.cover,
      width: double.infinity,
    ),


    errorWidget: (context, url, error) => Image.asset(
      "assets/images/notAvailableImage.png",
      fit: BoxFit.cover,
      width: double.infinity,
    ),
  )
      : Image.asset(
    "assets/images/notAvailableImage.png",
    fit: BoxFit.cover,
    width: double.infinity,
  );
}

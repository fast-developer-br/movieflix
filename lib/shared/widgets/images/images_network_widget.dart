import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImagesNetworkWidget extends StatelessWidget {
  final String imageUrl;
  final double radius;
  const ImagesNetworkWidget(
      {super.key, required this.imageUrl, this.radius = 0});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}

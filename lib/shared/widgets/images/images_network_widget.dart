import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImagesNetworkWidget extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final bool isCircle;
  const ImagesNetworkWidget(
      {super.key,
      required this.imageUrl,
      this.radius = 0,
      this.isCircle = false});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: isCircle ? null : BorderRadius.circular(radius),
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCacheNetworkImage extends StatelessWidget {
  const CustomCacheNetworkImage({
    Key key,
    @required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  final double width;
  final String imageUrl;
  final double height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: fit,
      imageUrl: imageUrl,
      errorWidget: (context, url, error) => Container(
        child: Icon(Icons.block, size: 48, color: Colors.red),
        width: width,
        height: height,
      ),
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        child: const Center(
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reelix/core/index.dart';

@immutable
final class CacheImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;
  const CacheImage({
    required this.imageUrl,
    this.fit,
    this.width,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit ?? BoxFit.cover,
      width: width,
      height: height,
      placeholder: (context, url) => const Center(
        child: CustomLoading(),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}

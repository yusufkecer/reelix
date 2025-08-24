import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reelix/core/index.dart';

@immutable
final class CacheImage extends StatelessWidget {
  final String imageUrl;
  const CacheImage({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    'imageUrl: $imageUrl'.logInfo();
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => const Center(
        child: CustomLoading(),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}

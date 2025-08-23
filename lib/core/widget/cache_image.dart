import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reelix/core/index.dart';

@immutable
final class CacheImage extends StatelessWidget {
  final String imageUrl;
  const CacheImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
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

final class AssetPath {
  AssetPath._(); // private constructor, instance oluşturulamaz

  static const _basePath = 'assets';
  static const lottie = '$_basePath/lottie';
  static const image = '$_basePath/images';
  static const language = '$_basePath/lang';
}

extension AssetPathExtension on String {
  String get lottie => '${AssetPath.lottie}/$this.json';
  String get image => '${AssetPath.image}/$this';
  String get language => '${AssetPath.language}/$this.json';
}

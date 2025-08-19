final class BasePaths {
  BasePaths._();

  static const _basePath = 'assets';
  static const lottie = '$_basePath/lottie';
  static const image = '$_basePath/images';
  static const language = '$_basePath/lang';
}

extension AssetPathExtension on String {
  String get lottie => '${BasePaths.lottie}/$this.json';
  String get pngImage => '${BasePaths.image}/$this.png';
  String get language => '${BasePaths.language}/$this.json';
}

enum AssetPath {
  google('google'),
  apple('apple'),
  facebook('facebook'),
  mail('message'),
  password('password'),
  hide('hide'),
  loading('loading');

  const AssetPath(this.path);
  final String path;
}

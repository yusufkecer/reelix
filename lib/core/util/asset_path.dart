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
  String get svgImage => '${BasePaths.image}/$this.svg';
  String get language => '${BasePaths.language}/$this.json';
}

enum AssetPath {
  google('google'),
  apple('apple'),
  facebook('facebook'),
  mail('message'),
  lock('lock'),
  hide('hide'),
  user('user'),
  addPhoto('plus'),
  back('back'),
  home('home'),
  profile('profile'),
  loading('loading'),
  diamond('diamond'),
  world('world'),
  arrow('arrow'),
  gem('gem'),
  heart('heart'),
  multiHeart('multi_heart'),
  logo('logo');

  const AssetPath(this.path);
  final String path;
}

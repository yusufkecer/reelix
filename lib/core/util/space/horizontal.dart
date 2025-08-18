import 'package:date_app/core/index.dart';
import 'package:flutter/material.dart';

@immutable
final class HorizontalSpace extends SizedBox {
  /// 4px
  HorizontalSpace.xxs({super.key}) : super(width: SpaceValues.xxs.value);

  /// 8px
  HorizontalSpace.xs({super.key}) : super(width: SpaceValues.xs.value);

  /// 10px
  HorizontalSpace.s({super.key}) : super(width: SpaceValues.s.value);

  /// 12px
  HorizontalSpace.m({super.key}) : super(width: SpaceValues.m.value);

  /// 16px
  HorizontalSpace.l({super.key}) : super(width: SpaceValues.l.value);

  /// 20px
  HorizontalSpace.xl({super.key}) : super(width: SpaceValues.xl.value);
}

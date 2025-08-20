import 'package:date_app/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
final class HorizontalSpace extends SizedBox {
  /// 4px
  HorizontalSpace.xxs({super.key}) : super(width: SpaceValues.xxs.value.w);

  /// 5px
  HorizontalSpace.five({super.key}) : super(width: SpaceValues.five.value.w);

  /// 8px
  HorizontalSpace.xs({super.key}) : super(width: SpaceValues.xs.value.w);

  /// 10px
  HorizontalSpace.s({super.key}) : super(width: SpaceValues.s.value.w);

  /// 12px
  HorizontalSpace.ss({super.key}) : super(width: SpaceValues.ss.value.w);

  /// 16px
  HorizontalSpace.sixteen({super.key}) : super(width: SpaceValues.sixteen.value.w);

  /// 20px
  HorizontalSpace.l({super.key}) : super(width: SpaceValues.l.value.w);

  /// 24px
  HorizontalSpace.xl({super.key}) : super(width: SpaceValues.xl.value.w);

  /// 14px
  HorizontalSpace.fourteen({super.key}) : super(width: SpaceValues.fourteen.value.w);

  /// 30px
  HorizontalSpace.thirty({super.key}) : super(width: SpaceValues.thirty.value.w);

  /// 32px
  HorizontalSpace.thirtyTwo({super.key}) : super(width: SpaceValues.thirtyTwo.value.w);

  /// 37px
  HorizontalSpace.thirtySeven({super.key}) : super(width: SpaceValues.thirtySeven.value.w);

  /// 39px
  HorizontalSpace.thirtyNine({super.key}) : super(width: SpaceValues.thirtyNine.value.w);

  /// 40px
  HorizontalSpace.forty({super.key}) : super(width: SpaceValues.forty.value.w);

  /// 53px
  HorizontalSpace.fiftyThree({super.key}) : super(width: SpaceValues.fiftyThree.value.w);

  /// 300px
  HorizontalSpace.threeHundred({super.key}) : super(width: SpaceValues.threeHundred.value.w);
}

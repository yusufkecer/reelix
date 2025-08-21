import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reelix/core/index.dart';

@immutable
final class VerticalSpace extends SizedBox {
  /// 4px
  VerticalSpace.xxs({super.key}) : super(height: SpaceValues.xxs.value.h);

  /// 8px
  VerticalSpace.xs({super.key}) : super(height: SpaceValues.xs.value.h);

  /// 10px
  VerticalSpace.s({super.key}) : super(height: SpaceValues.s.value.h);

  /// 12px
  VerticalSpace.ss({super.key}) : super(height: SpaceValues.ss.value.h);

  /// 16px
  VerticalSpace.sixteen({super.key}) : super(height: SpaceValues.sixteen.value.h);

  /// 20px
  VerticalSpace.l({super.key}) : super(height: SpaceValues.l.value.h);

  /// 24px
  VerticalSpace.xl({super.key}) : super(height: SpaceValues.xl.value.h);

  /// 24px
  VerticalSpace.twentyFour({super.key}) : super(height: SpaceValues.twentyFour.value.h);

  /// 14px
  VerticalSpace.fourteen({super.key}) : super(height: SpaceValues.fourteen.value.h);

  /// 30px
  VerticalSpace.thirty({super.key}) : super(height: SpaceValues.thirty.value.h);

  /// 32px
  VerticalSpace.thirtyTwo({super.key}) : super(height: SpaceValues.thirtyTwo.value.h);

  /// 37px
  VerticalSpace.thirtySeven({super.key}) : super(height: SpaceValues.thirtySeven.value.h);

  /// 38px
  VerticalSpace.thirtyEight({super.key}) : super(height: SpaceValues.thirtyEight.value.h);

  /// 39px
  VerticalSpace.thirtyNine({super.key}) : super(height: SpaceValues.thirtyNine.value.h);

  /// 40px
  VerticalSpace.forty({super.key}) : super(height: SpaceValues.forty.value.h);

  /// 53px
  VerticalSpace.fiftyThree({super.key}) : super(height: SpaceValues.fiftyThree.value.h);

  /// 138px
  VerticalSpace.oneHundredThirtyEight({super.key}) : super(height: SpaceValues.oneHundredThirtyEight.value.h);

  /// 300px
  VerticalSpace.threeHundred({super.key}) : super(height: SpaceValues.threeHundred.value.h);
}

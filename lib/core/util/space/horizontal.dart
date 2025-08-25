import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reelix/core/index.dart';

@immutable
final class HorizontalSpace extends SizedBox {
  /// 4px
  HorizontalSpace.xxs({super.key}) : super(width: SizeValues.xxs.value.w);

  /// 5px
  HorizontalSpace.five({super.key}) : super(width: SizeValues.five.value.w);

  /// 8px
  HorizontalSpace.xs({super.key}) : super(width: SizeValues.xs.value.w);

  /// 10px
  HorizontalSpace.s({super.key}) : super(width: SizeValues.s.value.w);

  /// 12px
  HorizontalSpace.ss({super.key}) : super(width: SizeValues.ss.value.w);

  /// 16px
  HorizontalSpace.sixteen({super.key})
    : super(width: SizeValues.sixteen.value.w);

  /// 20px
  HorizontalSpace.l({super.key}) : super(width: SizeValues.l.value.w);

  /// 14px
  HorizontalSpace.fourteen({super.key})
    : super(width: SizeValues.fourteen.value.w);

  /// 30px
  HorizontalSpace.thirty({super.key}) : super(width: SizeValues.thirty.value.w);

  /// 32px
  HorizontalSpace.thirtyTwo({super.key})
    : super(width: SizeValues.thirtyTwo.value.w);

  /// 37px
  HorizontalSpace.thirtySeven({super.key})
    : super(width: SizeValues.thirtySeven.value.w);

  /// 39px
  HorizontalSpace.thirtyNine({super.key})
    : super(width: SizeValues.thirtyNine.value.w);

  /// 40px
  HorizontalSpace.forty({super.key}) : super(width: SizeValues.forty.value.w);

  /// 47px
  HorizontalSpace.fortySeven({super.key})
    : super(width: SizeValues.fortySeven.value.w);

  /// 50px
  HorizontalSpace.fifty({super.key}) : super(width: SizeValues.fifty.value.w);

  /// 53px
  HorizontalSpace.fiftyThree({super.key})
    : super(width: SizeValues.fiftyThree.value.w);

  /// 250px
  HorizontalSpace.twoHundredFifty({super.key})
    : super(width: SizeValues.twoHundredFifty.value.w);

  /// 300px
  HorizontalSpace.threeHundred({super.key})
    : super(width: SizeValues.threeHundred.value.w);
}

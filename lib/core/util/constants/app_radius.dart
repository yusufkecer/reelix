import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class AppRadius extends BorderRadius {
  AppRadius.eight() : super.all(Radius.circular(8.r));
  AppRadius.ten() : super.all(Radius.circular(10.r));
  AppRadius.sixteen() : super.all(Radius.circular(16.r));
  AppRadius.eighteen() : super.all(Radius.circular(18.r));
  AppRadius.twenty() : super.all(Radius.circular(20.r));
  AppRadius.thirtyOne() : super.all(Radius.circular(31.r));
  AppRadius.eightyTwo() : super.all(Radius.circular(82.r));
  AppRadius.fifty() : super.all(Radius.circular(50.r));
  AppRadius.bottomSheetRadius() : super.vertical(top: Radius.circular(60.r));
}

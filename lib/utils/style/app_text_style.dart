import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle{
  //regular
  static TextStyle regular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  //medium
  static TextStyle medium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  //bold
  static TextStyle bold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  //semi bold
  static TextStyle semiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
}
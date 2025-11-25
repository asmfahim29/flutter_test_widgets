import 'package:flutter/material.dart';

class AppColors {
  static const Color kPrimary = Color(0xFFFFDF36);
  static const Color kBorder = Color(0xFFDFDFDF);
  static const Color kDarkGrey = Color(0xFF596371);
  static const Color kLightGrey = Color(0xFF858585);
  static const Color kWhite = Color(0xFFFFFFFF);
  static const Color kBlack = Color(0xFF000000);
  static const Color kLightPink = Color(0xFFBFBFBF);
  static const Color kLightPink2 = Color(0xFFF4F4F4);
  static const Color kLightPink3 = Color(0xFFF2F5F7);
  static const Color kRed = Color(0xFFFF2323);
  static const Color unkn = Color(0xFF36B843);
  static const Color unkn1 = Color(0xFF3B3B3B);
  static const Color unkn2 = Color(0xFF86C945);
  static const Color unkn3 = Color(0xFFF08127);
  static const Color unkn4 = Color(0xFF28BC3A);
  static const Color unkn5 = Color(0xFF46B942);
  static const Color unkn6 = Color(0xFFFFC911);
  static const Color unkn7 = Color(0xFFFFCB39);
  static const Color unkn8 = Color(0xFF37B842);
  static const Color unkn9 = Color(0xFF37B842);

  static BoxShadow defaultShadow = BoxShadow(
    color: AppColors.kPrimary.withOpacity(0.2),
    blurRadius: 7,
    offset: const Offset(0, 5),
  );

  static BoxShadow darkShadow = BoxShadow(
    color: AppColors.kPrimary.withOpacity(0.2),
    blurRadius: 7,
    offset: const Offset(0, 5),
  );
}
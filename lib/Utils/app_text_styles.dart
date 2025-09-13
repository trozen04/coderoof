import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  /// 🔹 Fix font size regardless of system text scaling
  static double _fixedFontSize(double size) {
    final scale = WidgetsBinding.instance.window.textScaleFactor;
    return size / scale;
  }

  static const String ManropeMedium = "ManropeMedium";
  static const String Manrope = "Manrope";
  static const String ManropeExtraBold = "ManropeExtraBold";
  static const String OnestBold = "OnestBold";
  static const String ManropeBold = "ManropeBold";

  static TextStyle heading(double width) => TextStyle(
    fontSize: _fixedFontSize(width * 0.055),
    fontWeight: FontWeight.w800,
    fontFamily: ManropeExtraBold,
    color: AppColors.primary,
  );

  static TextStyle subHeading(double width) => TextStyle(
    fontSize: _fixedFontSize(width * 0.04),
    fontWeight: FontWeight.w500,
    fontFamily: ManropeMedium,
    color: AppColors.gray800,
  );

  static TextStyle planPrice(double width, {bool isVip = false}) => TextStyle(
    fontSize: _fixedFontSize(width * 0.06),
    fontWeight: FontWeight.w700,
    fontFamily: ManropeBold,
    color: isVip ? AppColors.gold : AppColors.primary,
  );

  static TextStyle normal(double width, {Color color = AppColors.gray600}) =>
      TextStyle(
        fontSize: _fixedFontSize(width * 0.04), //16
        fontWeight: FontWeight.w500,
        fontFamily: ManropeMedium,
        color: color,
      );
  static TextStyle planDetails(double width, {Color color = AppColors.gray700}) =>
      TextStyle(
        fontSize: _fixedFontSize(width * 0.035),//14
        fontWeight: FontWeight.w500,
        fontFamily: ManropeMedium,
        color: color,
      );
  static TextStyle includedText(double width) =>
      TextStyle(
        fontSize: _fixedFontSize(width * 0.03), //12
        fontWeight: FontWeight.w600,
        fontFamily: ManropeMedium,
        color: AppColors.included,
      );

  static TextStyle mixerHead(double width) => TextStyle(
    fontSize: _fixedFontSize(width * 0.07),
    fontWeight: FontWeight.bold,
    fontFamily: OnestBold,
    color: AppColors.gray800,
  );
  static TextStyle continueButtonText(double width) => TextStyle(
    fontSize: _fixedFontSize(width * 0.04),
    fontWeight: FontWeight.w600,
    fontFamily: ManropeMedium,
    color: AppColors.white,
  );
  static TextStyle filterText(double width, {Color color = AppColors.gray600}) => TextStyle(
    fontSize: _fixedFontSize(width * 0.04),
    fontWeight: FontWeight.w600,
    fontFamily: ManropeMedium,
    color: color,
  );

  static TextStyle descriptionText(double width) => TextStyle(
    fontSize: _fixedFontSize(width * 0.025),
    fontWeight: FontWeight.w300,
    fontFamily: Manrope,
    color: AppColors.gray600,
  );
  static TextStyle seenNearby(double width) => TextStyle(
    fontSize: _fixedFontSize(width * 0.055),
    fontWeight: FontWeight.w700,
    fontFamily: ManropeBold,
    color: AppColors.gray800,
  );

}

import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';

/// HydroTracker 앱의 테마 설정을 담당합니다.
class AppTheme {
  // 색상 팔레트
  static const Color primaryColor = Color(AppConstants.primaryColor);
  static const Color secondaryColor = Color(AppConstants.secondaryColor);
  static const Color warningColor = Color(AppConstants.warningColor);
  static const Color dangerColor = Color(AppConstants.dangerColor);

  // 라이트 테마
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }

  // 다크 테마
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
      ),
      appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }

  // 물질별 색상
  static Color getSubstanceColor(String substance) {
    switch (substance) {
      case AppConstants.water:
        return primaryColor;
      case AppConstants.caffeine:
        return secondaryColor;
      case AppConstants.alcohol:
        return warningColor;
      case AppConstants.nicotine:
        return dangerColor;
      default:
        return Colors.grey;
    }
  }

  // 물질별 아이콘
  static IconData getSubstanceIcon(String substance) {
    switch (substance) {
      case AppConstants.water:
        return Icons.water_drop;
      case AppConstants.caffeine:
        return Icons.coffee;
      case AppConstants.alcohol:
        return Icons.local_bar;
      case AppConstants.nicotine:
        return Icons.smoking_rooms;
      default:
        return Icons.help_outline;
    }
  }

  // 물질별 이름 (한국어)
  static String getSubstanceName(String substance) {
    switch (substance) {
      case AppConstants.water:
        return '수분';
      case AppConstants.caffeine:
        return '카페인';
      case AppConstants.alcohol:
        return '알코올';
      case AppConstants.nicotine:
        return '니코틴';
      default:
        return '기타';
    }
  }

  // 물질별 단위
  static String getSubstanceUnit(String substance) {
    switch (substance) {
      case AppConstants.water:
        return AppConstants.liter;
      case AppConstants.caffeine:
        return AppConstants.milligram;
      case AppConstants.alcohol:
        return AppConstants.drink;
      case AppConstants.nicotine:
        return AppConstants.cigarette;
      default:
        return '';
    }
  }
}

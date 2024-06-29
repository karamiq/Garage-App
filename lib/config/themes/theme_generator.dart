// ignore_for_file: unused_element
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData _build(Brightness brightness) {
    final themeData = ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFFCFA),
        useMaterial3: true,
        brightness: brightness,
        inputDecorationTheme: _buildInputDecorationTheme(brightness),
        colorScheme: brightness == Brightness.light
            ? _buildColorScheme(brightness)
            : _buildColorSchemeDark(brightness),
        filledButtonTheme: _buildFilledButtonTheme(brightness),
        outlinedButtonTheme: _buildOutlinedButtonTheme(brightness),
        textButtonTheme: _buildTextButtonTheme(brightness),
        elevatedButtonTheme: _buildElevatedButtonTheme(brightness),
        datePickerTheme: _buildDatePickerTheme(brightness),
        checkboxTheme: CheckboxThemeData(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          splashRadius: 0,
          fillColor: WidgetStateProperty.all(Colors.transparent),
          checkColor: WidgetStateProperty.all(Colors.white),
          visualDensity: VisualDensity.compact,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          side: BorderSide(
            color: Colors.grey.shade400,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000),
            side: BorderSide(
              color: Colors.grey.shade400,
              width: 1,
            ),
          ),
        ));
    return themeData.copyWith(
      textTheme:
          // Device.get().isTablet
          //     ? TextTheme(
          //         headlineSmall: TextStyle(
          //           fontSize: 40,
          //           fontWeight: FontWeight.bold,
          //           fontFamily: 'Cairo',
          //           color: themeData.colorScheme.onBackground,
          //         ),
          //         headlineMedium: TextStyle(
          //           fontSize: 38,
          //           fontWeight: FontWeight.bold,
          //           fontFamily: 'Cairo',
          //           color: themeData.colorScheme.onBackground,
          //         ),
          //         headlineLarge: TextStyle(
          //           fontSize: 35,
          //           fontWeight: FontWeight.bold,
          //           fontFamily: 'Cairo',
          //           color: themeData.colorScheme.onBackground,
          //         ),
          //         bodySmall: TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.normal,
          //           fontFamily: 'Cairo',
          //           color: themeData.colorScheme.onBackground,
          //         ),
          //         bodyMedium: TextStyle(
          //           fontSize: 20,
          //           fontWeight: FontWeight.normal,
          //           fontFamily: 'Cairo',
          //           color: themeData.colorScheme.onBackground,
          //         ),
          //         bodyLarge: TextStyle(
          //           fontSize: 22,
          //           fontWeight: FontWeight.normal,
          //           fontFamily: 'Cairo',
          //           color: themeData.colorScheme.onBackground,
          //         ),
          //         labelLarge: TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.normal,
          //           fontFamily: 'Cairo',
          //           color: themeData.colorScheme.onBackground,
          //         ),
          //         labelMedium: TextStyle(
          //           fontSize: 20,
          //           fontWeight: FontWeight.normal,
          //           fontFamily: 'Cairo',
          //           color: themeData.colorScheme.onBackground,
          //         ),
          //         labelSmall: TextStyle(
          //           fontSize: 22,
          //           fontWeight: FontWeight.normal,
          //           fontFamily: 'Cairo',
          //           color: themeData.colorScheme.onBackground,
          //         ),
          //         displayLarge: TextStyle(
          //           fontSize: 30,
          //           fontWeight: FontWeight.bold,
          //           fontFamily: 'Cairo',
          //           color: themeData.colorScheme.onBackground,
          //         ),
          //         displayMedium: TextStyle(
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold,
          //           fontFamily: 'Cairo',
          //           color: themeData.colorScheme.onBackground,
          //         ),
          //         displaySmall: TextStyle(
          //           fontSize: 16,
          //           fontWeight: FontWeight.bold,
          //           fontFamily: 'Cairo',
          //           color: themeData.colorScheme.onBackground,
          //         ),
          //         titleLarge: TextStyle(
          //           fontSize: 30,
          //           fontWeight: FontWeight.normal,
          //           fontFamily: 'Cairo',
          //           color: themeData.colorScheme.onBackground,
          //         ),
          //         titleMedium: TextStyle(
          //           fontSize: 28,
          //           fontWeight: FontWeight.normal,
          //           fontFamily: 'Cairo',
          //           color: themeData.colorScheme.onBackground,
          //         ),
          //         titleSmall: TextStyle(
          //           fontSize: 26,
          //           fontWeight: FontWeight.normal,
          //           fontFamily: 'Cairo',
          //           color: themeData.colorScheme.onBackground,
          //         ),
          //       )
          // :
          _buildTextTheme(themeData.textTheme),
    );
  }

  Brightness getBrightness() {
    return currentBrightness.value;
  }

  final currentBrightness = ValueNotifier<Brightness>(Brightness.light);

  ThemeData buildDarkTheme() {
    currentBrightness.value = Brightness.dark;
    return _build(Brightness.dark);
  }

  ThemeData buildLightTheme() {
    currentBrightness.value = Brightness.light;
    return _build(Brightness.light);
  }

  InputDecorationTheme _buildInputDecorationTheme(Brightness brightness) {
    final colorScheme = _buildColorScheme(brightness);
    OutlineInputBorder buildBorder(Color color, {double width = 1}) {
      return OutlineInputBorder(
        gapPadding: 33,
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: color, width: width),
      );
    }

    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      fillColor: colorScheme.surface,
      filled: true,
      activeIndicatorBorder: BorderSide.none,
      border: buildBorder(colorScheme.outline.withOpacity(0.5)),
      errorBorder: buildBorder(colorScheme.error),
      enabledBorder: buildBorder(colorScheme.outline.withOpacity(0.5)),
      focusedBorder: buildBorder(colorScheme.primary),
      focusedErrorBorder: buildBorder(colorScheme.error, width: 2),
      disabledBorder: buildBorder(colorScheme.outline.withOpacity(0.5)),
    );
  }

  TextTheme _buildTextTheme(TextTheme textTheme) {
    return GoogleFonts.cairoTextTheme(textTheme);
  }

  ColorScheme _buildColorScheme(Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFFFFAE48),
      primary: const Color(0xFFFFAE48),
      //seedColor: const Color(0xFF0D233A),
      //primary: const Color(0xFF0D233A),
      //const Color(0xFFFFAE48),
      background: const Color.fromARGB(255, 227, 232, 250),
      brightness: brightness,
    );
    return colorScheme.copyWith(
      outline: colorScheme.outline.withOpacity(1),
    );
  }

  ColorScheme _buildColorSchemeDark(Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromRGBO(19, 71, 132, 0.531),
    );
    return colorScheme.copyWith(
      primaryContainer: colorScheme.primaryContainer.withOpacity(0.2),
      onPrimaryContainer: colorScheme.onPrimaryContainer.withOpacity(1),
    );
  }

  FilledButtonThemeData _buildFilledButtonTheme(Brightness brightness) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  OutlinedButtonThemeData _buildOutlinedButtonTheme(Brightness brightness) {
    final colorScheme = ThemeData.light();
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        foregroundColor: colorScheme.hintColor.withAlpha(100),
      ),
    );
  }

  TextButtonThemeData _buildTextButtonTheme(Brightness brightness) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  ElevatedButtonThemeData _buildElevatedButtonTheme(Brightness brightness) {
    final colorScheme = _buildColorScheme(
        brightness); // Assuming you have a _buildColorScheme function

    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: const Size(double.infinity, 50),
        backgroundColor:
            colorScheme.primary, // Use primary color from color scheme
        foregroundColor: Colors.white, // White text color for foreground
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  DatePickerThemeData _buildDatePickerTheme(Brightness) {
    return DatePickerThemeData(
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      rangePickerHeaderBackgroundColor: Colors.transparent,
      rangeSelectionBackgroundColor: Colors.transparent,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.transparent,
      ),
      headerBackgroundColor: Colors.transparent,
      rangePickerBackgroundColor: Colors.transparent,
      dayBackgroundColor: WidgetStatePropertyAll(Colors.transparent),
    );
  }
}

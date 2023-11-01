import 'package:electrical_project/src/app.dart';
import 'package:electrical_project/src/optional_web.dart';
import 'package:electrical_project/src/routing/app_router.dart';
import 'package:electrical_project/src/utilities/scroll_fix.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      title: 'Electrical Proj.',
      scrollBehavior: AppScrollBehavior(),
      theme: FlexThemeData.light(
        scheme: FlexScheme.deepPurple,
        surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
        blendLevel: 15,
        appBarStyle: FlexAppBarStyle.material,
        appBarOpacity: 1,
        appBarElevation: 2,
        transparentStatusBar: true,
        tabBarStyle: FlexTabBarStyle.forAppBar,
        tooltipsMatchBackground: true,
        swapColors: false,
        lightIsWhite: false,
        useMaterial3: true,
        useMaterial3ErrorColors: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // To use playground font, add GoogleFonts package and uncomment:
        fontFamily: GoogleFonts.outfit().fontFamily,
        subThemesData: const FlexSubThemesData(
          useTextTheme: true,
          fabUseShape: true,
          appBarCenterTitle: true,
          interactionEffects: true,
          navigationBarMutedUnselectedIcon: true,
          bottomNavigationBarOpacity: 1,
          bottomNavigationBarElevation: 0,
          inputDecoratorIsFilled: true,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          inputDecoratorUnfocusedHasBorder: true,
          blendOnColors: true,
          blendTextTheme: true,
          popupMenuOpacity: 0.95,
        ),
      ).copyWith(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.all(18),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          modalBackgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.material,
        surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
        blendLevel: 15,
        appBarStyle: FlexAppBarStyle.material,
        appBarOpacity: 1,
        appBarElevation: 2,
        transparentStatusBar: true,
        tabBarStyle: FlexTabBarStyle.flutterDefault,
        tooltipsMatchBackground: true,
        swapColors: false,
        darkIsTrueBlack: false,
        useMaterial3: true,
        useMaterial3ErrorColors: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // To use playground font, add GoogleFonts package and uncomment:
        fontFamily: GoogleFonts.outfit().fontFamily,
        subThemesData: const FlexSubThemesData(
          useTextTheme: true,
          fabUseShape: true,
          interactionEffects: true,
          bottomNavigationBarOpacity: 1,
          bottomNavigationBarElevation: 0,
          inputDecoratorIsFilled: true,
          appBarCenterTitle: true,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          inputDecoratorUnfocusedHasBorder: true,
          blendOnColors: true,
          blendTextTheme: true,
          navigationBarMutedUnselectedIcon: true,
          popupMenuOpacity: 0.95,
        ),
      ).copyWith(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          contentPadding: const EdgeInsets.all(18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          modalBackgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
      ),
      themeMode: ThemeMode.system,
    );
  }
}

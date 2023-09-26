import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_shop_3/home_bottom_nav_var.dart';
import 'package:shoe_shop_3/pages/all_categories.dart';
import 'package:shoe_shop_3/theme/app_theme.dart';
import 'package:shoe_shop_3/theme/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

// ThemeManager themeManager = ThemeManager();
// bool isDarkMode = false;

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
      return MaterialApp(
        title: 'Shoe Shop',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeProvider.currentTheme == AppTheme.darkTheme
            ? ThemeMode.dark
            : ThemeMode.light,
        routes: {
          '/': (context) => HomeBtmNavBarPage(),
          // '/allcategories': (context) => AllCategoriesPage(),
        },
        initialRoute: '/',
      );
    });
  }
}

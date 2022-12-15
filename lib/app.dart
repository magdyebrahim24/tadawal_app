import 'package:flutter/material.dart';
import 'package:tadawal/config/app_routes/app_routes.dart';
import 'package:tadawal/config/themes/app_theme.dart';
import 'package:tadawal/core/utils/app_strings.dart';

class TadawalApp extends StatelessWidget {
  const TadawalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: AppTheme().lightTheme,
      debugShowCheckedModeBanner: false,
      // home:  const AddProductScreen(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}

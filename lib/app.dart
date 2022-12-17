import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadawal/config/app_routes/app_routes.dart';
import 'package:tadawal/config/locale/app_localizations_setup.dart';
import 'package:tadawal/config/themes/app_theme.dart';
import 'package:tadawal/core/utils/app_strings.dart';
import 'package:tadawal/features/splash_screen/presentation/cubit/local_cubit.dart';
import 'package:tadawal/features/splash_screen/presentation/cubit/local_states.dart';
import 'package:tadawal/features/splash_screen/presentation/cubit/theme_cubit/theme_cubit.dart';
import 'injection_container.dart' as di;

class TadawalApp extends StatelessWidget {
  const TadawalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<LocaleCubit>()..getSavedLanguage(),
        ),
        BlocProvider(
          create: (context) => di.sl<ThemeCubit>()..getSavedTheme(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: ((previous, current) => previous != current ),
        builder: (context, state) {
          return MaterialApp(
            title: AppStrings.appName,
            theme: AppTheme().lightTheme,
            debugShowCheckedModeBanner: false,
            // home:  const DarkBuilder(),
            onGenerateRoute: AppRoutes.onGenerateRoute,
            locale: state.locale,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback:
            AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates: AppLocalizationsSetup
                .localizationsDelegates,
          );
        },
      ),
    );
  }
}

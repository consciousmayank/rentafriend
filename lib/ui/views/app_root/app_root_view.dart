import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rentafriend/app/app.router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'app_root_viewmodel.dart';
import 'package:rentafriend/ui/common/app_theme.dart';

class AppRootView extends StackedView<AppRootViewModel> {
  const AppRootView({super.key});

  @override
  Widget builder(
      BuildContext context, AppRootViewModel viewModel, Widget? child) {
    return ResponsiveApp(
      builder: (_) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system, //
        routerDelegate: stackedRouter.delegate(),
        routeInformationParser: stackedRouter.defaultRouteParser(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: viewModel.currentLocale,
        supportedLocales: viewModel.supportedLocales,
      ),
    ).animate().fadeIn(
          delay: const Duration(milliseconds: 50),
          duration: const Duration(milliseconds: 400),
        );
  }

  @override
  AppRootViewModel viewModelBuilder(BuildContext context) => AppRootViewModel();

  @override
  void onViewModelReady(AppRootViewModel viewModel) => viewModel.init();
}

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rentafriend/helpers/utils/translation_helper.dart';

import 'home_view.desktop.dart';
import 'home_view.tablet.dart';
import 'home_view.mobile.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const HomeViewDesktop(),
      tablet: (_) => const HomeViewTablet(),
      desktop: (_) => const HomeViewDesktop(),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

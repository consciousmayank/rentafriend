import 'package:flutter/material.dart';
import 'package:rentafriend/ui/views/app_root/app_root_view.dart';
import 'package:rentafriend/app/app.bottomsheets.dart';
import 'package:rentafriend/app/app.dialogs.dart';
import 'package:rentafriend/app/app.locator.dart';
import 'package:rentafriend/app/app.router.dart';
import 'package:url_strategy/url_strategy.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await setupLocator(stackedRouter: stackedRouter);
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const AppRootView());
}

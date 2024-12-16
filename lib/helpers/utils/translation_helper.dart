import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stacked_services/stacked_services.dart';

class Tr {
  static AppLocalizations of(BuildContext context) {
    return AppLocalizations.of(context)!;
  }

  static AppLocalizations get current {
    final context = StackedService.navigatorKey?.currentContext;
    if (context == null) throw Exception('No context available');
    return of(context);
  }
}

import 'package:flutter/material.dart';
import 'package:rentafriend/app/app.bottomsheets.dart';
import 'package:rentafriend/app/app.dialogs.dart';
import 'package:rentafriend/app/app.locator.dart';
import 'package:rentafriend/services/language_service.dart';
import 'package:rentafriend/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends StreamViewModel<Locale> {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _languageService = locator<LanguageService>();

  @override
  Stream<Locale> get stream => _languageService.languageStream;

  Future<void> changeLanguage(String languageCode) async {
    await _languageService.setLocale(languageCode);
    notifyListeners();
  }

  List<String> get supportedLocales =>
      _languageService.getSupportedLocales().map((e) => e.languageCode).toList();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rentafriend/app/app.locator.dart';
import 'package:rentafriend/services/language_service.dart';
import 'package:stacked/stacked.dart';

class AppRootViewModel extends StreamViewModel<Locale> {
  final _languageService = locator<LanguageService>();
  Locale? _currentLocale;

  Locale? get currentLocale => _currentLocale;

  @override
  Stream<Locale> get stream => _languageService.languageStream;

  List<Locale> get supportedLocales => _languageService.getSupportedLocales();

  @override
  void onData(Locale? data) {
    _currentLocale = data;
    notifyListeners();
  }

  Future<void> init() async {
    _currentLocale = await _languageService.getCurrentLocale();
    notifyListeners();
  }
}

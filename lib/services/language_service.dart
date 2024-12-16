import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rentafriend/app/app.locator.dart';
import 'package:rentafriend/services/preferences_service.dart';

class LanguageService {
  final _preferencesService = locator<PreferencesService>();
  static const String _defaultLocale = 'en';

  final _languageController = StreamController<Locale>.broadcast();
  Stream<Locale> get languageStream => _languageController.stream;

  Future<Locale> getCurrentLocale() async {
    final savedLocale = await _preferencesService.getSelectedLanguage();
    return Locale(savedLocale ?? _defaultLocale);
  }

  Future<void> setLocale(String languageCode) async {
    await _preferencesService.setSelectedLanguage(languageCode);
    _languageController.add(Locale(languageCode));
  }

  List<Locale> getSupportedLocales() {
    return const [
      Locale('en'),
      Locale('es'),
      Locale('hi'),
    ];
  }

  void dispose() {
    _languageController.close();
  }
}

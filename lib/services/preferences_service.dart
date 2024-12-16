import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:rentafriend/app/app.locator.dart';
import 'package:rentafriend/services/environment_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:flutter/foundation.dart' show Uint8List, kIsWeb;

// abstract class PreferenceInterface {
//   Future<void> setUserLoggedIn(bool isLoggedIn);
//   Future<bool> getUserLoggedIn();
//   Future<String?> getSelectedLanguage();
//   Future<void> setSelectedLanguage(String languageCode);
// }

class PreferencesService implements InitializableDependency {
  final String appBox = 'appBox';
  late Box _appBox;
  late List<int> _key;

  //String constants
  final String _preferencesKey = 'preferencesKey';
  final String _userLoggedIn = 'userLoggedIn';
  final String _selectedLanguage = 'selectedLanguage';

  @override
  Future<void> init() async {
    await _initializeHive();
  }

  String ensureValidKey(String key) {
  final bytes = utf8.encode(key);
  if (bytes.length >= 32) {
    return utf8.decode(bytes.take(32).toList());
  }
  // Pad with zeros if too short
  return utf8.decode(bytes + List.filled(32 - bytes.length, 0));
}

  Future<void> _initializeHive() async {
    try {
      // Hive.generateSecureKey();
      final validKey = ensureValidKey(EnvironmentService.appPreferenceKey);
      _key = Uint8List.fromList(utf8.encode(validKey));

      await Hive.initFlutter();

      // Close existing box if it's open
      if (Hive.isBoxOpen(appBox)) {
        await Hive.box(appBox).close();
      }

      _appBox = await _openBox(boxName: appBox);
      print('Box opened successfully'); // Debug log
    } catch (e) {
      print('Error in _initializeHive: $e'); // Error logging
      rethrow;
    }
  }

  Future<Box<T>> _openBox<T>({required String boxName}) async {
    if (kIsWeb) {
      // For web, we might want to use a non-encrypted box
      return await Hive.openBox<T>(boxName);
    } else {
      // For mobile, use encryption
      return await Hive.openBox<T>(boxName,
          encryptionCipher: HiveAesCipher(_key));
    }
  }

  Future<bool> getUserLoggedIn() async {
    return _appBox.get(_userLoggedIn, defaultValue: false);
  }

  Future<void> setUserLoggedIn(bool isLoggedIn) async {
    await _appBox.put(_userLoggedIn, isLoggedIn);
  }

  Future<String?> getSelectedLanguage() async {
    final language = _appBox.get(_selectedLanguage);
    print('Retrieved language: $language'); // Debug log
    return language;
  }

  Future<void> setSelectedLanguage(String languageCode) async {
    print('Saving language: $languageCode'); // Debug log
    await _appBox.put(_selectedLanguage, languageCode);
    // Verify immediately after saving
    final saved = _appBox.get(_selectedLanguage);
    print('Verified saved language: $saved'); // Debug log
  }
}

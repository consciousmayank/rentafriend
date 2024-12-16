import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rentafriend/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:rentafriend/services/http_service.dart';
import 'package:rentafriend/services/environment_service.dart';
import 'package:rentafriend/services/preferences_service.dart';
import 'package:rentafriend/services/language_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<RouterService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<HttpService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<EnvironmentService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<PreferencesService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LanguageService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterRouterService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterHttpService();
  getAndRegisterEnvironmentService();
  getAndRegisterPreferencesService();
  getAndRegisterLanguageService();
// @stacked-mock-register
}

MockRouterService getAndRegisterRouterService() {
  _removeRegistrationIfExists<RouterService>();
  final service = MockRouterService();
  locator.registerSingleton<RouterService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockHttpService getAndRegisterHttpService() {
  _removeRegistrationIfExists<HttpService>();
  final service = MockHttpService();
  locator.registerSingleton<HttpService>(service);
  return service;
}

MockEnvironmentService getAndRegisterEnvironmentService() {
  _removeRegistrationIfExists<EnvironmentService>();
  final service = MockEnvironmentService();
  locator.registerSingleton<EnvironmentService>(service);
  return service;
}

MockPreferencesService getAndRegisterPreferencesService() {
  _removeRegistrationIfExists<PreferencesService>();
  final service = MockPreferencesService();
  locator.registerSingleton<PreferencesService>(service);
  return service;
}

MockLanguageService getAndRegisterLanguageService() {
  _removeRegistrationIfExists<LanguageService>();
  final service = MockLanguageService();
  locator.registerSingleton<LanguageService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}

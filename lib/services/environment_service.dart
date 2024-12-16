import 'package:rentafriend/enums/environment.dart';

class EnvironmentService {
  static const String kEnvDevelopment = 'Development';
  static const String kEnvProduction = 'Production';
  static const String kEnvStaging = 'Staging';

  static const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: kEnvDevelopment,
  );
  static const String appPreferenceKey = String.fromEnvironment('APP_PREFERENCE_KEY');
  static const String baseUrl = String.fromEnvironment('BASE_URL');

  static bool get isDevelopment =>
      currentEnvironment == Environment.development;
  static bool get isProduction => currentEnvironment == Environment.production;
  static bool get isStaging => currentEnvironment == Environment.staging;

  static Environment get currentEnvironment {
    switch (environment) {
      case kEnvDevelopment:
        return Environment.development;
      case kEnvProduction:
        return Environment.production;
      case kEnvStaging:
        return Environment.staging;
      default:
        return Environment.development;
    }
  }
}

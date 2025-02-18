import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfig {
  static late String? token;
  static late String? userTalentId;
  static late String baseUrl =
      "https://platform-api-service.onrender.com/api/v1";

  static SharedPreferences? preferences;

  // Static async initialization function
  static Future<void> initializeAppInformation() async {
    // Initialize SharedPreferences
    preferences = await SharedPreferences.getInstance();

    String? tok = getLocalStorageItem('token');
    String? user = getLocalStorageItem('userTalentId');

    token = tok;
    userTalentId = user;
  }

  // Static methods for SharedPreferences
  static Future<void> setLocalStorageItem(String key, String val) async {
    await preferences!.setString(key, val);
  }

  static String? getLocalStorageItem(String key) {
    return preferences!.getString(key);
  }

  static void removeLocalStorageItem(String key) {
    preferences!.remove(key);
  }
}

class CustomLogger {
  // Create a logger instance
  static final Logger _logger = Logger();

  // Method to log messages based on the environment
  static void logDebug(String message) {
    if (kDebugMode) {
      _logger.d(message); // Log debug messages only in debug mode
    }
  }

  static void logInfo(String message) {
    if (kDebugMode) {
      _logger.i(message); // Log info messages only in debug mode
    }
  }

  static void logWarning(String message) {
    if (kDebugMode) {
      _logger.w(message); // Log warning messages only in debug mode
    }
  }

  static void logError(String message) {
    if (kDebugMode) {
      _logger.e(message); // Log error messages only in debug mode
    }
  }
}

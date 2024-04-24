import 'package:shared_preferences/shared_preferences.dart';

final sharedPreference = UserSharedPref();

class UserSharedPref {
  late SharedPreferences _sharedpreferences;
  static const String SELECTED_LANGUAGE = "selected_language";
  static const String NAME = 'name';
  static const String EMAIL = "email";
  static const String AUTH_STATUS = "authStatus";

  init() async {
    _sharedpreferences = await SharedPreferences.getInstance();
  }

  Future<bool> get authStatus async {
    return _sharedpreferences.getBool(AUTH_STATUS) ?? false;
  }

  void saveAuthStatus(bool value) {
    _sharedpreferences.setBool(AUTH_STATUS, value);
  }

  Future<void> saveName(String name) async {
    _sharedpreferences.setString(NAME, name);
  }

  String? get getName {
    return _sharedpreferences.getString(NAME);
  }

  Future<void> saveEmail(String email) async {
    _sharedpreferences.setString(EMAIL, email);
  }

  String? get getEmail {
    return _sharedpreferences.getString(EMAIL);
  }

  Future<void> saveLanguage(String languageCode) async {
    _sharedpreferences.setString(SELECTED_LANGUAGE, languageCode);
  }

  String? getLanguage() {
    return _sharedpreferences.getString(SELECTED_LANGUAGE);
  }
}

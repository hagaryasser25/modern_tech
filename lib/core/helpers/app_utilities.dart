import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/navigation_service.dart';
import 'package:easy_localization/easy_localization.dart';

class AppUtilities {
  final int storeUserId = 111;

  String firebaseToken = 'emptyToken';

  static final AppUtilities _instance = AppUtilities._internal();

  static AppUtilities get instance => _instance;

  factory AppUtilities() {
    return _instance;
  }

  AppUtilities._internal() {
    _getSavedData();
  }

  Future<void> initialize() async {
    await _getSavedData();
  }

  Future<void> importantInitialize() async {
    _isLTR = await getSavedString(
            "isLTR", getDeviceLanguage() == 'ar' ? 'false' : 'true') ==
        'true';
    showIntroduction =
        await getSavedString("showIntroduction", 'true') == 'true';
    _languageCode = await getSavedString("languageCode", getDeviceLanguage());
    // _serverToken = await getSavedString("serverToken", '');
  }

  bool? _isLTR;

  bool get isLTR {
    return _isLTR ?? false;
  }

  set isLTR(bool x) {
    _isLTR = x;
    setSavedString("isLTR", x ? 'true' : 'false');
  }

  bool? _showIntroduction;

  bool get showIntroduction {
    return _showIntroduction ?? true;
  }

  set showIntroduction(bool x) {
    _showIntroduction = x;
    setSavedString("showIntroduction", x ? 'true' : 'false');
  }

  String? _languageCode;

  String get languageCode {
    return _languageCode ?? getDeviceLanguage();
  }

  String getDeviceLanguage() {
    return Platform.localeName.split('_')[0];
  }

  /*

  Future<String> getUniqueDeviceId() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      return androidInfo.id;
    } else {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      return iosInfo.identifierForVendor!;
    }
  }
  */

  set languageCode(String code) {
    _languageCode = code;
    if (code == "ar") {
      isLTR = false;
    } else {
      isLTR = true;
    }
    setSavedString("languageCode", code);
    setLocality(code);
  }

  String? _serverToken;

  String get serverToken {
    return _serverToken ?? "";
  }

  set serverToken(String token) {
    _serverToken = token;
    setSavedString("serverToken", token);
  }

  bool? _isLogin;

  bool get isLogin {
    return _isLogin ?? false;
  }

  set isLogin(bool x) {
    _isLogin = x;

    if (!x) {
      // _loginData = LoginResponse();
      setSavedString("userData", '');
      setSavedString("serverToken", '');
      _serverToken = null;
    }
    setSavedString("isLogin", x ? 'true' : 'false');
  }

  //LoginResponse? _loginData = LoginResponse();

/*
  LoginResponse get loginData {
    return _loginData!;
  }
 

  set loginData(LoginResponse x) {
    serverToken = "Bearer ${x.authToken ?? ""}";
    _loginData = x;
    setSavedString("userData", jsonEncode(x.toJson()));
    log("saved");
  }
   */

  Future<void> _getSavedData() async {
    _isLogin = await getSavedString("isLogin", 'false') == 'true';

    _serverToken = await getSavedString("serverToken", '');

/*
    if (await getSavedString('userData', '') != '') {
      log(await getSavedString('userData', ''));
      _loginData = LoginResponse.fromJson(
          jsonDecode(await getSavedString('userData', '')));
    }
    if (_loginData?.userData?.isParent == 0) {
      _appType = AppType.student;
    } else if (_loginData?.userData?.isParent == 1) {
      _appType = AppType.parent;
    }
    */
  }

  Future<bool> setSavedString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool savedValue = await prefs.setString(key, value);
    return savedValue;
  }

  Future<void> clearSharedPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  Future<String> getSavedString(String value, String defaultVal) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.reload();
    String savedValue = preferences.getString(value) ?? defaultVal;

    return savedValue;
  }

  void setLocality(String code) async {
    NavigationService.navigatorKey.currentContext?.setLocale(Locale(code));
  }
}

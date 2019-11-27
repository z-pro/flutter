import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class UserAccountUtil {
  static final String IS_LOGIN = "isLogin";
  static final String USER_NAME = "userName";

  static Future saveLoginInfo(String userName) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setBool(IS_LOGIN, true);
    await sp.setString(USER_NAME, userName);
  }

  static Future clearLoginInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.clear();
  }

  static Future<String> getUserName() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(USER_NAME);
  }

  static Future<bool> isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getBool(IS_LOGIN);
  }

}

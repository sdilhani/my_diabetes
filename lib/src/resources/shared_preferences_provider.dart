
import 'dart:html';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String> getLoggedInUserEmail(){
    return _prefs.then((value) =>
        value.getString("email")
    );
  }

  Future<bool> setLoggedInUserEmail(String email){
    return _prefs.then((value) =>
        value.setString("email", email)
    );
  }

  Future<bool> setLoggedInUserImage(String image){
    return _prefs.then((value) =>
        value.setString("image", image)
    );
  }

  Future<String> getLoggedInUserImage(){
    return _prefs.then((value) =>
        value.getString("image")
    );
  }

  Future<bool> isLoggedIn(){
    return _prefs.then((value) =>
        value.getBool("isLoggedIn")
    );
  }

  Future<bool> setLoggedIn(bool isLoggedIn){
    return _prefs.then((value) =>
        value.setBool("isLoggedIn", isLoggedIn)
    );
  }

  Future<String> getUserName(){
    return _prefs.then((value) =>
        value.getString("firstName") + " " + value.getString("lastName")
    );
  }

  Future<bool> setUserName(String firstName, String lastName){
    return _prefs.then((value) =>
      value.setString("firstName", firstName).then((_) => value.setString("lastName", lastName))
    );
  }

  Future<String> getLoggedInUserPassword(){
    return _prefs.then((value) =>
        value.getString("password")
    );
  }

  Future<bool> setLoggedInUserPassword(String password){
    return _prefs.then((value) =>
        value.setString("password", password)
    );
  }
}
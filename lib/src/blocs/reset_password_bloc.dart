import 'dart:async';

import 'package:my_diabetes/src/ui/widget/reset_password_form_data.dart';
import 'package:rxdart/rxdart.dart';

import '../resources/repository.dart';

class ResetPasswordBloc {
  final _repository = Repository();
  final _password = BehaviorSubject<String>();
  final _oldPassword = BehaviorSubject<String>();
  final _rePassword = BehaviorSubject<String>();
  Observable<String> get password =>
      _password.stream.transform(_validatePassword);

  Observable<String> get rePassword =>
      _rePassword.stream.transform(_validatePassword);

  Observable<String> get oldPassword =>
      _oldPassword.stream.transform(_validatePassword);

  // Change data
  Function(String) get changePassword => _password.sink.add;

  Function(String) get changeRePassword => _rePassword.sink.add;

  Function(String) get changeOldPassword => _oldPassword.sink.add;

  final _validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 3) {
      sink.add(password);
    } else {
      sink.addError("Invalid Password");
    }
  });

  Future<String> updatePassword() async {
    String error = "Something went wrong!";

    await _repository.getLoggedInUserEmail().then((value) async => {
      if(value.isNotEmpty){
       await  _repository.getUserByEmail(value).then((userModel) async => {
          if(_oldPassword.value == userModel.password){
            await _repository.updatePassword(userModel.uid, _rePassword.value).then((value) => {
              error = "Successfully updated the password"
            })
          } else {
            error = "Old password is not correct",
          }
        })
      } else {
        error = "invalid user"
      }
    });
    return error;
  }

  Stream<String> getUserImage() {
    return _repository.getLoggedInUserImage().asStream();
  }

  void dispose() async {
    await _password.drain();
    _password.close();
    await _rePassword.drain();
    _rePassword.close();
    await _oldPassword.drain();
    _oldPassword.close();
  }

  String validateFields() {
     if (_password.value == null ||
        _password.value.isEmpty ||
        _password.value.length < 3) {
      return "Invalid Password";
    } else if (_rePassword.value == null || _rePassword.value.isEmpty) {
      return "Invalid Re-Password";
    } else if (_rePassword.value != _password.value) {
      return "Password and re-password in not matching";
    } else if (_oldPassword.value == null ||
         _oldPassword.value.isEmpty ||
         _oldPassword.value.length < 3) {
      return "Invalid Old Password";
    } else {
      return "";
    }
  }
}

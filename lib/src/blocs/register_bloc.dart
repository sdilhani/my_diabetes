import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../resources/repository.dart';

class RegisterBloc {
  final _repository = Repository();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _rePassword = BehaviorSubject<String>();
  final _firstName = BehaviorSubject<String>();
  final _lastName = BehaviorSubject<String>();
  final _phoneNumber = BehaviorSubject<String>();
  final _isProcessing = BehaviorSubject<bool>();

  Observable<String> get email => _email.stream.transform(_validateEmail);

  Observable<String> get password =>
      _password.stream.transform(_validatePassword);

  Observable<String> get rePassword =>
      _rePassword.stream.transform(_validatePassword);

  //Observable<String> get emailAddress => _email.stream.dematerialize();

  Observable<String> get firstName => _firstName.stream;

  Observable<String> get lastName => _lastName.stream;

  Observable<String> get phoneNumber => _phoneNumber.stream;

  Observable<bool> get processStatus => _isProcessing.stream;

  // Change data
  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changePassword => _password.sink.add;

  Function(String) get changeRePassword => _rePassword.sink.add;

  Function(String) get changeFirstName => _firstName.sink.add;

  Function(String) get changeLastName => _lastName.sink.add;

  Function(String) get changePhone => _phoneNumber.sink.add;

  Function(bool) get showProgressBar => _isProcessing.sink.add;

  final _validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@') && email.contains('.')) {
      sink.add(email);
    } else {
      sink.addError("Invalid Email");
    }
  });

  final _validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 3) {
      sink.add(password);
    } else {
      sink.addError("Invalid Password");
    }
  });

  Future<void> registerUser() {
    return _repository.registerUser(_firstName.value, _lastName.value,
        _phoneNumber.value, _email.value, _password.value);
  }

  void dispose() async {
    await _email.drain();
    _email.close();
    await _password.drain();
    _password.close();
    await _rePassword.drain();
    _rePassword.close();
    await _firstName.drain();
    _firstName.close();
    await _lastName.drain();
    _lastName.close();
    await _phoneNumber.drain();
    _phoneNumber.close();
    await _isProcessing.drain();
    _isProcessing.close();
  }

  String validateFields() {
    if (_email.value == null ||
        _email.value.isEmpty ||
        !_email.value.contains('@') ||
        !_email.value.contains('.')) {
      return "Invalid Email";
    } else if (_password.value == null ||
        _password.value.isEmpty ||
        _password.value.length < 3) {
      return "Invalid Password";
    } else if (_rePassword.value == null || _rePassword.value.isEmpty) {
      return "Invalid Re-Password";
    } else if (_rePassword.value != _password.value) {
      return "Password and re-password in not matching";
    } else if (_firstName.value == null || _firstName.value.isEmpty) {
      return "First name is required";
    } else if (_lastName.value == null || _lastName.value.isEmpty) {
      return "Last name is required";
    } else if (_phoneNumber.value == null || _phoneNumber.value.isEmpty) {
      return "Phone number is required";
    } else if (_phoneNumber.value.length < 10) {
      return "Phone number is invalid";
    } else {
      return "";
    }
  }
}

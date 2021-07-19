import 'dart:async';
import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc {
  final _repository = Repository();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _rePassword = BehaviorSubject<String>();

  Observable<String> get email => _email.stream.transform(_validateEmail);

  Observable<String> get password =>
      _password.stream.transform(_validatePassword);

  Observable<String> get rePassword =>
      _rePassword.stream.transform(_validatePassword);

  String get emailAddress => _email.value;

  // Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeRePassword => _rePassword.sink.add;

  final _validateEmail =
  StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
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
    return _repository.registerUser("_firstName.value", "_lastName.value", "_phoneNumber.value", _email.value, _password.value);
  }

  void dispose() async {
    await _email.drain();
    _email.close();
    await _password.drain();
    _password.close();
    await _rePassword.drain();
    _rePassword.close();
  }

  bool validateFields() {
    if (_email.value != null &&
        _email.value.isNotEmpty &&
        _password.value != null &&
        _password.value.isNotEmpty &&
        _rePassword.value != null &&
        _rePassword.value.isNotEmpty &&
        // _firstName.value != null &&
        // _firstName.value.isNotEmpty &&
        // _lastName.value != null &&
        // _lastName.value.isNotEmpty &&
        // _phoneNumber.value != null &&
        // _phoneNumber.value.isNotEmpty &&
        _email.value.contains('@') &&
        _password.value.length > 3) {
      return true;
    } else {
      return false;
    }
  }
}
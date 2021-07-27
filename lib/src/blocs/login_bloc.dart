import 'dart:async';
import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final _repository = Repository();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _isSignedIn = BehaviorSubject<bool>();

  Observable<String> get email => _email.stream.transform(_validateEmail);

  Observable<String> get password =>
      _password.stream.transform(_validatePassword);

  Observable<bool> get signInStatus => _isSignedIn.stream;

  // Change data
  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changePassword => _password.sink.add;

  Function(bool) get showProgressBar => _isSignedIn.sink.add;

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

  Future<int> submit() {
    return _repository.authenticateUser(_email.value, _password.value);
  }

  void dispose() async {
    await _email.drain();
    _email.close();
    await _password.drain();
    _password.close();
    await _isSignedIn.drain();
    _isSignedIn.close();
  }

  String validateFields() {
    if (_email.value == null ||
        _email.value.isEmpty ||
        !_email.value.contains('@') ||
        !_email.value.contains('.')){
      return "Invalid Email";
    } else if(
        _password.value == null ||
        _password.value.isEmpty ||
        _password.value.length < 3) {
      return "Invalid Password";
    } else {
      return "";
    }
  }

  Future<bool> isLoggedIn(){
    return _repository.isLoggedIn();
  }
}
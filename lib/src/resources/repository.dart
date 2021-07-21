import 'firestore_provider.dart';

class Repository {
  final _firestoreProvider = FirestoreProvider();

  Future<int> authenticateUser(String email, String password) =>
      _firestoreProvider.authenticateUser(email, password);

  Future<void> registerUser(String firstName, String lastName,String phone,String email, String password) =>
      _firestoreProvider.registerUser(firstName, lastName, phone, email, password);
}
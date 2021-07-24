import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_diabetes/src/models/models.dart';
import 'package:my_diabetes/src/resources/shared_preferences_provider.dart';

import 'firestore_provider.dart';

class Repository {
  final _firestoreProvider = FirestoreProvider();
  final _sharedPreferenceProvider = SharedPreferencesProvider();
  
  Future<int> authenticateUser(String email, String password) async {
    final List<DocumentSnapshot> docs = await _firestoreProvider.authenticateUser(email, password);

    if (docs.length == 0) {
      print("len 0");
      return 0;
    } else {
      String firstName = docs[0].data.containsKey("firstName") ? docs[0].data["firstName"] : "N/A";
      String lastName = docs[0].data.containsKey("lastName") ? docs[0].data["lastName"] : "N/A";
      String image = docs[0].data.containsKey("image") ? docs[0].data["image"] : "N/A";
      String password = docs[0].data.containsKey("password") ? docs[0].data["password"] : "N/A";
      String email = docs[0].data.containsKey("email") ? docs[0].data["email"] : "N/A";

      await setUserName(firstName, lastName);
      await setLoggedInUserEmail(email);
      await setLoggedInUserPassword(password);
      await setLoggedInUserImage(image);
      return 1;
    }
  }

  Future<void> registerUser(String firstName, String lastName, String phone,
      String email, String password) =>
      _firestoreProvider.registerUser(
          firstName, lastName, phone, email, password);

  Stream<List<ArticleModel>> getAllArticles() =>
      Stream.fromFuture(_firestoreProvider.getAllArticles());

  Stream<List<DoctorModel>> getAllDoctors() =>
      Stream.fromFuture(_firestoreProvider.getAllDoctors("doctor"));

  Stream<List<DoctorModel>> getAllConsultants() =>
      Stream.fromFuture(_firestoreProvider.getAllDoctors("con"));

  Stream<List<HospitalModel>> getHospitalsByIds(List<String> ids) =>
      Stream.fromFuture(_firestoreProvider.getHospitalsByIds(ids));

  Stream<List<FoodModel>> getAllFood() =>
      Stream.fromFuture(_firestoreProvider.getAllFood());


  Future<String> getLoggedInUserEmail(){
    return _sharedPreferenceProvider.getLoggedInUserEmail();
  }

  Future<String> getLoggedInUserImage(){
    return _sharedPreferenceProvider.getLoggedInUserImage();
  }

  Future<bool> setLoggedInUserEmail(String email){
    return _sharedPreferenceProvider.setLoggedInUserEmail(email);
  }

  Future<bool> setLoggedInUserImage(String image){
    return _sharedPreferenceProvider.setLoggedInUserImage(image);
  }

  Future<bool> isLoggedIn(){
    return _sharedPreferenceProvider.isLoggedIn();
  }

  Future<bool> setLoggedIn(bool isLoggedIn){
    return _sharedPreferenceProvider.setLoggedIn(isLoggedIn);
  }

  Future<String> getUserName(){
    return _sharedPreferenceProvider.getUserName();
  }

  Future<bool> setUserName(String firstName, String lastName){
    return _sharedPreferenceProvider.setUserName(firstName, lastName);
  }

  Future<String> getLoggedInUserPassword(){
    return _sharedPreferenceProvider.getUserName();
  }

  Future<bool> setLoggedInUserPassword(String password){
    return _sharedPreferenceProvider.setLoggedInUserPassword(password);
  }
}
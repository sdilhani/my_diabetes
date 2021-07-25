import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_diabetes/src/models/models.dart';

class FirestoreProvider {
  Firestore _firestore = Firestore.instance;

  Future< List<DocumentSnapshot>> authenticateUser(String email, String password) async {
    final QuerySnapshot result = await _firestore
        .collection("users")
        .where("email", isEqualTo: email)
        .where("password", isEqualTo: password)
        .getDocuments();

    return result.documents;

  }

  Future< List<DocumentSnapshot>> getUserByEmail(String email) async {
    final QuerySnapshot result = await _firestore
        .collection("users")
        .where("email", isEqualTo: email)
        .getDocuments();

    return result.documents;
  }

  Future<void> updatePassword(String id, String password) async {
    await _firestore
        .collection("users").document(id).updateData({'password': password});

    return;
  }

  Future<void> registerUser(String firstName, String lastName,String phone,String email, String password) async {
    return _firestore
        .collection("users")
        .document(email)
        .setData(
        {'email': email,
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
          'phone': phone,
        });
  }

  Future<List<ArticleModel>> getAllArticles() async {
    final QuerySnapshot result = await _firestore
        .collection("articles")
        .getDocuments();
    final List<ArticleModel>  articles  = [];

    result.documents.forEach((element) {
        ArticleModel articleModel = ArticleModel(
            element.documentID,
            element.data.containsKey("name") ? element["name"] : "",
            element.data.containsKey("image") ? element["image"] : "",
            element.data.containsKey("url") ? element["url"] : "");

        articles.add(articleModel);
    });

    return articles;
  }

  Future<List<FoodModel>> getAllFood() async {
    final QuerySnapshot result = await _firestore
        .collection("foods")
        .getDocuments();
    final List<FoodModel>  foods  = [];

    result.documents.forEach((element) {
      FoodModel articleModel = FoodModel(
            element.data.containsKey("name") ? element["name"] : "",
            element.data.containsKey("icon") ? element["icon"] : "",
            element.data.containsKey("sugar") ? element["sugar"] : "",
      );

      foods.add(articleModel);
    });

    return foods;
  }

  Future<List<DoctorModel>> getAllDoctors(String type) async {
    final QuerySnapshot result = await _firestore
        .collection("doctors")
        .where("type", isEqualTo: type)
        .getDocuments();
    final List<DoctorModel>  doctors  = [];

    print(result.documents.length);

    result.documents.forEach((element) {
      print(element.documentID);
      print((element.data.containsKey("hospitals") ? element["hospitals"] : [""]).runtimeType);

      List<dynamic> hospitalData = (element.data.containsKey("hospitals") ? element["hospitals"] : [""]);
      List<String> hospitals = [];

      hospitalData.forEach((element) {
          hospitals.add(element.toString());
      });

        DoctorModel doctorModel = DoctorModel(
            element.documentID,
            element.data.containsKey("name") ? element["name"] : "",
            "",
            "",
            element.data.containsKey("email") ? element["email"] : "",
            element.data.containsKey("phone") ? element["phone"] : "",
            element.data.containsKey("designation") ? element["designation"] : "",
            element.data.containsKey("type") ? element["type"] : "",
            element.data.containsKey("chargePerChannel") ? element["chargePerChannel"] : "",
            element.data.containsKey("image") ? element["image"] : "",
            hospitals);

        doctors.add(doctorModel);
    });

    return doctors;
  }

  Future<List<HospitalModel>> getHospitalsByIds(List<String> ids) async {

    final QuerySnapshot result = await _firestore
        .collection("hospitals")
        .where("id", whereIn: ids)
        .getDocuments();
    final List<HospitalModel>  hospitals  = [];

    int len = result.documents.length;
    print("Res count $len");

    result.documents.forEach((element) {
        HospitalModel hospitalModel = HospitalModel(
            element.data.containsKey("name") ? element["name"] : "",
            element.data.containsKey("logo") ? element["logo"] : "",
            element.data.containsKey("address") ? element["address"] : "",
            element.data.containsKey("email") ? element["email"] : "",
            element.data.containsKey("phone") ? element["phone"] : "",
            element.data.containsKey("taxPercentage") ? element["taxPercentage"] : "",
            element.data.containsKey("serviceCharge") ? element["serviceCharge"] : "",
            element.data.containsKey("id") ? element["id"] : "");

        hospitals.add(hospitalModel);
    });

    return hospitals;
  }
}
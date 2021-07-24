import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_diabetes/src/models/models.dart';

class FirestoreProvider {
  Firestore _firestore = Firestore.instance;

  Future<int> authenticateUser(String email, String password) async {
    final QuerySnapshot result = await _firestore
        .collection("users")
        .where("email", isEqualTo: email)
        .where("password", isEqualTo: password)
        .getDocuments();
    final List<DocumentSnapshot> docs = result.documents;

    if (docs.length == 0) {
      print("len 0");
      return 0;
    } else {
      print("len 1");
      return 1;
    }
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

  Future<List<DoctorModel>> getAllDoctors() async {
    final QuerySnapshot result = await _firestore
        .collection("doctors")
        .getDocuments();
    final List<DoctorModel>  doctors  = [];

    result.documents.forEach((element) {
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
            element.data.containsKey("hospitals") ? element["hospitals"] : "");

        doctors.add(doctorModel);
    });

    return doctors;
  }

  Future<List<HospitalModel>> getHospitalsByIds(List<String> ids) async {
    final QuerySnapshot result = await _firestore
        .collection("doctors")
        .where("country", arrayContainsAny: ids)
        .getDocuments();
    final List<HospitalModel>  hospitals  = [];

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
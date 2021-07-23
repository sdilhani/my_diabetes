import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_diabetes/src/models/models.dart';

class FirestoreProvider {
  Firestore _firestore = Firestore.instance;

  Future<int> authenticateUser(String email, String password) async {
    final QuerySnapshot result = await _firestore
        .collection("users")
        .where("email", isEqualTo: email)
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
}
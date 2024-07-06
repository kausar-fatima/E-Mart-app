import 'package:e_mart_app/consts/consts.dart';

class FirestoreServices {
  // get user data
  static getUser(uid) {
    return firestore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  // gewt products according to category
  static getProducts(category) {
    return firestore
        .collection(productCollection)
        .where('p_category', isEqualTo: category)
        .snapshots();
  }
}

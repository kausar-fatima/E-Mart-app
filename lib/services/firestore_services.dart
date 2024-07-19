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

  // get cart
  static getCart(uid) {
    return firestore
        .collection(cartCollection)
        .where("added_by", isEqualTo: uid)
        .snapshots();
  }

  // delete document
  static deleteDocument(docId) {
    return firestore.collection(cartCollection).doc(docId).delete();
  }

  // get all chat messages
  static getChatMessages(docId) {
    print(
        "${firestore.collection(chatsCollection).doc(docId).collection(messagesCollection).orderBy('created_on', descending: false).snapshots()}");
    return firestore
        .collection(chatsCollection)
        .doc(docId)
        .collection(messagesCollection)
        .orderBy('created_on', descending: false)
        .snapshots();
  }

  // get all Orders
  static getAllOrders() {
    return firestore
        .collection(ordersCollection)
        .where('order_by', isEqualTo: currentUser!.uid)
        .snapshots();
  }

  // get wishlist
  static getWishList() {
    return firestore
        .collection(productCollection)
        .where('p_wishlist', arrayContains: currentUser!.uid)
        .snapshots();
  }

  // get all messages
  static getAllMessages() {
    return firestore
        .collection(chatsCollection)
        .where('fromId', isEqualTo: currentUser!.uid)
        .snapshots();
  }

  static getCounts() async {
    var res = await Future.wait(
      [
        firestore
            .collection(cartCollection)
            .where('added_by', isEqualTo: currentUser!.uid)
            .get()
            .then(
          (value) {
            return value.docs.length;
          },
        ),
        firestore
            .collection(productCollection)
            .where('p_wishlist', arrayContains: currentUser!.uid)
            .get()
            .then(
          (value) {
            return value.docs.length;
          },
        ),
        firestore
            .collection(ordersCollection)
            .where('order_by', isEqualTo: currentUser!.uid)
            .get()
            .then(
          (value) {
            return value.docs.length;
          },
        ),
      ],
    );

    return res;
  }

  static allproducts() {
    return firestore.collection(productCollection).snapshots();
  }

  // get featured products method
  static getFeaturedProducts() {
    return firestore
        .collection(productCollection)
        .where('is_featured', isEqualTo: true)
        .get();
  }

  static searchProducts(title) {
    return firestore.collection(productCollection).get();
  }

  static getSubCategoryProducts(title) {
    return firestore
        .collection(productCollection)
        .where('p_subcategory', isEqualTo: title)
        .snapshots();
  }
}

import 'package:e_mart_app/consts/consts.dart';
import 'package:e_mart_app/models/category_model.dart';

class ProductController extends GetxController {
  var quantity = 0.obs;
  var colorIndex = 0.obs;
  var totalprice = 0.obs;
  var isFav = false.obs;
  var subcat = [];
  getSubCategories(title) async {
    subcat.clear();
    try {
      var data =
          await rootBundle.loadString("lib/services/category_model.json");
      var decoded = categoryModelFromJson(data);
      var s =
          decoded.categories.where((element) => element.name == title).toList();

      if (s.isNotEmpty) {
        for (var e in s[0].subcateory) {
          subcat.add(e);
        }
      } else {
        print("No subcategories found for the title: $title");
      }
    } catch (e) {
      print("Error loading subcategories: $e");
    }
  }

  changeColorIndex(index) {
    colorIndex.value = index;
  }

  increaseQuantity(totalQuantity) {
    if (quantity.value < totalQuantity) quantity.value++;
  }

  decreaseQuantity() {
    if (quantity.value > 0) quantity.value--;
  }

  calculateTotalPrice(price) {
    totalprice.value = price * quantity.value;
  }

  addToCart(
      {title, img, sellername, color, qty, tprice, context, vendorId}) async {
    await firestore.collection(cartCollection).doc().set({
      "title": title,
      "img": img,
      "sellername": sellername,
      "vendor_id": vendorId,
      "color": color,
      "qty": qty,
      "tprice": tprice,
      "added_by": currentUser!.uid
    }).catchError((error) {
      VxToast.show(context, msg: error.toString());
    });
  }

  resetValues() {
    totalprice.value = 0;
    quantity.value = 0;
    colorIndex.value = 0;
  }

  addToWishlist(docId, context) async {
    await firestore.collection(productCollection).doc(docId).set({
      'p_wishlist': FieldValue.arrayUnion([currentUser!.uid])
    }, SetOptions(merge: true));
    isFav(true);
    VxToast.show(context, msg: "Added to wishlist");
  }

  removeFromWishlist(docId, context) async {
    await firestore.collection(productCollection).doc(docId).set({
      'p_wishlist': FieldValue.arrayRemove([currentUser!.uid])
    }, SetOptions(merge: true));
    isFav(false);
    VxToast.show(context, msg: "Removed from wishlist");
  }

  checkIffav(data) async {
    if (data['p_wishlist'].contains(currentUser!.uid)) {
      isFav(true);
    } else {
      isFav(false);
    }
  }
}

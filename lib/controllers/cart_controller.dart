import 'dart:math';

import 'package:e_mart_app/consts/consts.dart';

class CartController extends GetxController {
  var totalP = 0.obs;

  // text controllers for shipping details

  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var postalController = TextEditingController();
  var phoneController = TextEditingController();

  var paymentIndex = 0.obs;

  late dynamic productSnapshot;
  var products = [];
  var vendors = [];
  var placingOrder = false.obs;

  calculate(data) {
    totalP.value = 0;
    for (var i = 0; i < data.length; i++) {
      totalP.value = totalP.value + int.parse(data[i]['tprice'].toString());
    }
  }

  String generateOrderCode() {
    var timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    var random = Random().nextInt(10000).toString().padLeft(4, '0');
    return '$timestamp$random';
  }

  changePaymentIndex(index) {
    paymentIndex.value = index;
  }

  placeMyOrder({required orderPaymentMethod, required totalAmount}) async {
    placingOrder.value = true;
    // Generate dynamic order code
    String orderCode = generateOrderCode();
    await getProductDetails();
    await firestore.collection(ordersCollection).doc().set({
      "order_by": currentUser!.uid,
      "order_by_name": Get.find<HomeController>().username,
      "order_by_email": currentUser!.email,
      "order_by_address": addressController.text,
      "order_by_state": stateController.text,
      "order_by_city": cityController.text,
      "order_by_phone": phoneController.text,
      "order_by_postalcode": postalController.text,
      "shipping_method": "Home Delivery",
      "payment_method": orderPaymentMethod,
      "order_placed": true,
      "order_confirmed": false,
      "order_delivered": false,
      "order_on_delivery": false,
      "total_amount": totalAmount,
      "orders": FieldValue.arrayUnion(products),
      "order_code": orderCode,
      "vendors": FieldValue.arrayUnion(vendors)
    });
    placingOrder(false);
  }

  getProductDetails() {
    products.clear();
    vendors.clear();
    for (var i = 0; i < productSnapshot.length; i++) {
      products.add({
        "color": productSnapshot[i]['color'],
        "img": productSnapshot[i]['img'],
        "qty": productSnapshot[i]['qty'],
        "title": productSnapshot[i]['title'],
        "vendor_id": productSnapshot[i]['vendor_id'],
        "tprice": productSnapshot[i]['tprice'],
      });
      vendors.add(productSnapshot[i]['vendor_id']);
    }
  }

  clearCart() {
    for (var i = 0; i < productSnapshot.length; i++) {
      firestore.collection(cartCollection).doc(productSnapshot[i].id).delete();
    }
  }
}

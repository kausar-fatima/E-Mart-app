import 'package:e_mart_app/consts/consts.dart';
import 'package:e_mart_app/models/category_model.dart';

class ProductController extends GetxController {
  var quantity = 0.obs;
  var colorIndex = 0.obs;
  var totalprice = 0.obs;
  var subcat = [];
  getSubCategories(title) async {
    subcat.clear();
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var decoded = categoryModelFromJson(data);
    var s =
        decoded.categories.where((element) => element.name == title).toList();

    for (var e in s[0].subcateory) {
      subcat.add(e);
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
}

import 'package:e_mart_app/consts/consts.dart';
import 'package:e_mart_app/models/category_model.dart';

class ProductController extends GetxController {
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
}

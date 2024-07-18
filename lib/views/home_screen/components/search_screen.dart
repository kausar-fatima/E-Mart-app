import 'package:e_mart_app/consts/consts.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title.text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: FutureBuilder(
        future: FirestoreServices.searchProducts(title),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return "No products found".text.makeCentered();
          } else if (snapshot.data!.docs.isEmpty) {
            return "No products found".text.makeCentered();
          } else {
            var data = snapshot.data!.docs;
            var filtered = data
                .where(
                  (element) =>
                      element['p_name'].toString().toLowerCase().contains(
                            title!.toLowerCase(),
                          ),
                )
                .toList();
            return GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 300),
              children: filtered.mapIndexed(
                (currentValue, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        filtered[index]['p_imgs'][0],
                        width: 130,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                      10.heightBox,
                      "${filtered[index]['p_name'][0]}"
                          .text
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .make(),
                      10.heightBox,
                      "${filtered[index]['p_price'][0]}"
                          .numCurrency
                          .text
                          .color(redColor)
                          .size(16)
                          .fontFamily(bold)
                          .make(),
                    ],
                  )
                      .box
                      .white
                      .outerShadowMd
                      .margin(const EdgeInsets.symmetric(horizontal: 8))
                      .roundedSM
                      .padding(EdgeInsets.all(8))
                      .make()
                      .onTap(
                    () {
                      Get.to(
                        () => ItemDetails(
                          title: "${filtered[index]['p_name']}",
                          data: filtered[index],
                        ),
                      );
                    },
                  );
                },
              ).toList(),
            );
          }
        },
      ),
    );
  }
}

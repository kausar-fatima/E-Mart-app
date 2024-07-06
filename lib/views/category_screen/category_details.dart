import 'package:e_mart_app/consts/consts.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(),
        ),
        body: StreamBuilder(
          stream: FirestoreServices.getProducts(title),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: loadingIndicator(),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: "No products found".text.color(darkFontGrey).make(),
              );
            } else {
              var data = snapshot.data!.docs;
              return Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.subcat.length,
                          (index) => controller.subcat[index]
                              .toString()
                              .text
                              .size(12)
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .makeCentered()
                              .box
                              .white
                              .roundedSM
                              .size(120, 60)
                              .margin(
                                EdgeInsets.symmetric(horizontal: 4),
                              )
                              .make(),
                        ),
                      ),
                    ),
                    20.heightBox,
                    //Items container
                    Expanded(
                        child: Container(
                      //color: lightGrey,
                      child: GridView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: data.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 250,
                            mainAxisSpacing: 8,
                          ),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  data[index]['p_imgs'][0],
                                  height: 150,
                                  width: 200,
                                  fit: BoxFit.cover,
                                ),
                                10.heightBox,
                                "${data[index]['p_name']}"
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                10.heightBox,
                                "${data[index]['p_price']}"
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
                                .margin(EdgeInsets.symmetric(horizontal: 12))
                                .roundedSM
                                .outerShadowSm
                                .padding(EdgeInsets.all(8))
                                .make()
                                .onTap(
                              () {
                                Get.to(
                                  () => ItemDetails(
                                    title: "${data[index]['p_name']}",
                                    data: data[index],
                                  ),
                                );
                              },
                            );
                          }),
                    )),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

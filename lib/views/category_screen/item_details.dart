import 'package:e_mart_app/consts/consts.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(
            icon: Icon(
              Icons.share,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.favorite_outline,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VxSwiper.builder(
                      autoPlay: true,
                      height: 350,
                      itemCount: 3,
                      aspectRatio: 16 / 9,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imgFc5,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    10.heightBox,
                    //title and details section
                    title!.text
                        .size(16)
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),

                    10.heightBox,

                    // rating
                    VxRating(
                        onRatingUpdate: (value) {},
                        normalColor: textfieldGrey,
                        selectionColor: golden,
                        count: 5,
                        size: 25,
                        stepInt: true),
                    10.heightBox,

                    "\$30.00"
                        .text
                        .color(redColor)
                        .size(18)
                        .fontFamily(bold)
                        .make(),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              "Seller".text.white.fontFamily(semibold).make(),
                              5.heightBox,
                              "In House Brands"
                                  .text
                                  .fontFamily(semibold)
                                  .color(darkFontGrey)
                                  .size(16)
                                  .make(),
                            ],
                          ),
                        ),
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.message_rounded,
                            color: darkFontGrey,
                          ),
                        )
                      ],
                    )
                        .box
                        .height(60)
                        .padding(
                          EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                        )
                        .color(textfieldGrey)
                        .make(),

                    20.heightBox,
                    // color section
                    Column(children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Color".text.color(textfieldGrey).make(),
                          ),
                          Row(
                            children: List.generate(
                                3,
                                (index) => VxBox()
                                    .size(40, 40)
                                    .roundedFull
                                    .color(Vx.randomPrimaryColor)
                                    .margin(
                                      EdgeInsets.symmetric(horizontal: 4),
                                    )
                                    .make()),
                          ),
                        ],
                      ).box.padding(EdgeInsets.all(8)).make(),

                      //quantity section
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Quantity".text.color(textfieldGrey).make(),
                          ),
                          Row(children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.remove),
                            ),
                            "0"
                                .text
                                .size(16)
                                .color(darkFontGrey)
                                .fontFamily(bold)
                                .make(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add),
                            ),
                            10.widthBox,
                            "(0 available)".text.color(textfieldGrey).make()
                          ]),
                        ],
                      ).box.padding(EdgeInsets.all(8)).make(),

                      // total row
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Total".text.color(textfieldGrey).make(),
                          ),
                          "\$0.00"
                              .text
                              .color(redColor)
                              .fontFamily(bold)
                              .size(16)
                              .make(),
                        ],
                      ),
                    ]).box.white.shadowSm.make(),

                    10.heightBox,
                    //description section
                    "Description"
                        .text
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),
                    10.heightBox,
                    "Here is Item description...."
                        .text
                        .color(darkFontGrey)
                        .make(),

                    // buttons Section
                    10.heightBox,
                    ListView(
                      shrinkWrap: true,
                      children: List.generate(
                          itemDetailButtonsList.length,
                          (index) => ListTile(
                                title: itemDetailButtonsList[index]
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                trailing: Icon(Icons.arrow_forward),
                              )),
                    ),

                    20.heightBox,
                    //products may like section
                    productsyoumaylike.text
                        .fontFamily(bold)
                        .size(16)
                        .color(darkFontGrey)
                        .make(),
                    10.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          6,
                          (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                imgP1,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              10.heightBox,
                              "Laptop 4GB/64GB"
                                  .text
                                  .fontFamily(semibold)
                                  .color(darkFontGrey)
                                  .make(),
                              10.heightBox,
                              "\$600"
                                  .text
                                  .color(redColor)
                                  .size(16)
                                  .fontFamily(bold)
                                  .make(),
                            ],
                          )
                              .box
                              .white
                              .margin(EdgeInsets.symmetric(horizontal: 8))
                              .roundedSM
                              .padding(EdgeInsets.all(8))
                              .make(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: cusButton(
                color: redColor,
                onPress: () {},
                textColor: whiteColor,
                title: "Add to cart"),
          ),
        ],
      ),
    );
  }
}

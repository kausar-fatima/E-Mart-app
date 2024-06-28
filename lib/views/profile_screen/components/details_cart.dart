import 'package:e_mart_app/consts/consts.dart';

Widget detailsCard({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.fontFamily(bold).color(darkFontGrey).make(),
      5.heightBox,
      title!.text.color(darkFontGrey).make(),
    ],
  )
      .box
      .white
      .roundedSM
      .width(width)
      .height(60)
      .padding(EdgeInsets.symmetric(horizontal: 2))
      .make();
}

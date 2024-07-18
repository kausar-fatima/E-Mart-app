import 'package:e_mart_app/consts/consts.dart';

Widget featuredButton({String? title, icon}) {
  return Row(
    children: [
      Image.asset(
        icon,
        width: 40,
        fit: BoxFit.fill,
      ),
      10.widthBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  )
      .box
      .width(200)
      .padding(EdgeInsets.all(4))
      .white
      .margin(EdgeInsets.symmetric(horizontal: 4))
      .roundedSM
      .outerShadowSm
      .make()
      .onTap(
    () {
      Get.to(
        () => CategoryDetails(
          title: title,
        ),
      );
    },
  );
}

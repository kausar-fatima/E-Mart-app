import 'package:e_mart_app/consts/consts.dart';

Widget homeButtons({width, height, icon, String? title, onPress}) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          icon,
          width: 26,
        ),
        10.heightBox,
        title!.text.fontFamily(semibold).color(darkFontGrey).make()
      ],
    ).box.rounded.white.size(width, height).shadowSm.make(),
  );
}

import 'package:e_mart_app/consts/consts.dart';

Widget OrderPlaceDetails(
    {required String title1,
    required String title2,
    required String d1,
    required String d2}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title1.text.fontFamily(semibold).make(),
            d1.text
                .color(redColor)
                .fontFamily(semibold)
                .make() // yeah batein.. yeah text kia hai?
          ],
        ),
        SizedBox(
          width: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title2.text.fontFamily(semibold).make(),
              d2.text.color(redColor).fontFamily(semibold).make()
            ],
          ),
        )
      ],
    ),
  );
}

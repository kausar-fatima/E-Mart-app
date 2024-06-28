import 'package:e_mart_app/consts/consts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // edit profile button
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.edit,
                color: whiteColor,
              ).marginOnly(top: 12, right: 12),
            ).onTap(() {}),

            // users details section
            Row(
              children: [
                Image.asset(
                  imgProfile,
                  width: 100,
                  fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Fatima".text.white.fontFamily(semibold).make(),
                      "customer@example.com".text.white.make(),
                    ],
                  ),
                ),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: whiteColor)),
                    onPressed: () {},
                    child: logout.text.fontFamily(semibold).white.make())
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                detailsCard(
                    count: "00",
                    title: "In your cart",
                    width: context.screenWidth / 3.5),
                detailsCard(
                    count: "32",
                    title: "In your wishlist",
                    width: context.screenWidth / 3.5),
                detailsCard(
                    count: "675",
                    title: "your orders",
                    width: context.screenWidth / 3.5)
              ],
            ),
            // buttons section

            ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.asset(
                          profileButtonIcon[index],
                          width: 22,
                        ),
                        title: profileButtonsList[index]
                            .text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(color: lightGrey);
                    },
                    itemCount: profileButtonsList.length)
                .box
                .white
                .rounded
                .padding(EdgeInsets.symmetric(
                  horizontal: 16,
                ))
                .margin(EdgeInsets.symmetric(horizontal: 10, vertical: 10))
                .shadowSm
                .make()
                .box
                .color(redColor)
                .make()
          ],
        ),
      ),
    ));
  }
}

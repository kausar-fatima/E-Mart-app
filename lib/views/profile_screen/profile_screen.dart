import 'package:e_mart_app/consts/consts.dart';
import 'package:e_mart_app/views/chat_screen/messaging_screen.dart';
import 'package:e_mart_app/views/orders_screen/order_screen.dart';
import 'package:e_mart_app/views/wishlist_screen/wishlist_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    FirestoreServices.getCounts();

    return bgWidget(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else {
              var data = snapshot.data!.docs[0];

              return SafeArea(
                child: Column(
                  children: [
                    // edit profile button
                    Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.edit,
                        color: whiteColor,
                      ).marginOnly(top: 12, right: 12),
                    ).onTap(() {
                      controller.nameController.text = data['name'];
                      Get.to(
                        () => EditProfileScreen(
                          data: data,
                        ),
                      );
                    }),

                    // users details section
                    Row(
                      children: [
                        data['imageUrl'] == ''
                            ? Image.asset(
                                imgProfile2,
                                width: 100,
                                fit: BoxFit.cover,
                              ).box.roundedFull.clip(Clip.antiAlias).make()
                            : Image.network(
                                data['imageUrl'],
                                width: 70,
                                fit: BoxFit.cover,
                              )
                                .box
                                .margin(EdgeInsets.symmetric(horizontal: 8))
                                .roundedFull
                                .clip(Clip.antiAlias)
                                .make(),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              data['name']
                                  .toString()
                                  .text
                                  .white
                                  .fontFamily(semibold)
                                  .make(),
                              data['email'].toString().text.white.make(),
                            ],
                          ),
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(color: whiteColor)),
                            onPressed: () async {
                              await Get.put(AuthController())
                                  .signoutMethod(context);
                              Get.offAll(() => const LoginScreen());
                            },
                            child:
                                logout.text.fontFamily(semibold).white.make())
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        detailsCard(
                            count: data['cart_count'],
                            title: "In your cart",
                            width: context.screenWidth / 3.5),
                        detailsCard(
                            count: data['wishlist_count'],
                            title: "In your wishlist",
                            width: context.screenWidth / 3.5),
                        detailsCard(
                            count: data['order_count'],
                            title: "your orders",
                            width: context.screenWidth / 3.5)
                      ],
                    ),
                    // buttons section

                    ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                onTap: () {
                                  switch (index) {
                                    case 0:
                                      Get.to(() => const OrderScreen());
                                      break;
                                    case 1:
                                      Get.to(() => const WishlistScreen());
                                      break;
                                    case 2:
                                      Get.to(() => const MessagesScreen());
                                      break;
                                  }
                                },
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
                        .margin(
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10))
                        .shadowSm
                        .make()
                        .box
                        .color(redColor)
                        .make()
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

import 'dart:io';

import 'package:e_mart_app/consts/consts.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, this.data});

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // if data image Url and controller path is empty
              data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                  ? Image.asset(imgProfile2, width: 100, fit: BoxFit.cover)
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .make()
                  // if data is not empty but controller path is empty
                  : data['imageUrl'] != '' && controller.profileImgPath.isEmpty
                      ? Image.network(
                          data['imageUrl'],
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make()
                      // if both are not empty
                      : Image.file(
                          File(controller.profileImgPath.value),
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make(),
              //10.heightBox,
              cusButton(
                  color: redColor,
                  onPress: () {
                    controller.changeImage(context);
                  },
                  textColor: whiteColor,
                  title: 'Change'),
              Divider(),
              20.heightBox,
              customTextField(
                  hint: nameHint,
                  title: name,
                  isPass: false,
                  controller: controller.nameController),
              10.heightBox,
              customTextField(
                  hint: passwordHint,
                  title: oldpass,
                  isPass: true,
                  controller: controller.oldpassController),
              10.heightBox,
              customTextField(
                  hint: passwordHint,
                  title: newpass,
                  isPass: true,
                  controller: controller.newpassController),
              20.heightBox,
              controller.isLoading.value
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    )
                  : SizedBox(
                      width: context.screenWidth - 60,
                      child: cusButton(
                          color: redColor,
                          onPress: () async {
                            controller.isLoading(true);

                            // if image is not selected
                            if (controller.profileImgPath.value.isNotEmpty) {
                              await controller.uploadProfileImage();
                            } else {
                              controller.profileImgLink = data['imageUrl'];
                            }

                            // if old pass and new pass are same

                            if (data['password'] ==
                                controller.oldpassController.text) {
                              await controller.changeAuthPassword(
                                  email: data['email'],
                                  password: controller.oldpassController.text,
                                  newpassword:
                                      controller.newpassController.text);
                              await controller.updateProfile(
                                name: controller.nameController.text,
                                password: controller.newpassController.text,
                                imgUrl: controller.profileImgLink,
                              );
                              VxToast.show(context, msg: "Profile Updated");
                            } else {
                              VxToast.show(context, msg: "Wrong old password");
                              controller.isLoading(false);
                            }
                          },
                          textColor: whiteColor,
                          title: 'Save'),
                    ),
            ],
          )
              .box
              .white
              .shadowSm
              .padding(EdgeInsets.all(16))
              .margin(EdgeInsets.only(top: 50, left: 18, right: 18))
              .roundedSM
              .make(),
        ),
      ),
    );
  }
}

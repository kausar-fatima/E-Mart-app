import 'package:e_mart_app/consts/consts.dart';

class ChatsController extends GetxController {
  @override
  void onInit() {
    print("CHAT INIT CALLED");
    getChatId();
    super.onInit();
  }

  var chats = firestore.collection(chatsCollection);

  var friendName = Get.arguments[0];
  var friendId = Get.arguments[1];

  var senderName = Get.find<HomeController>().username;
  var currentId = currentUser!.uid;

  var msgController = TextEditingController();
  dynamic chatDocId;

  var isLoading = false.obs;

  getChatId() async {
    try {
      isLoading(true);
      // yeah error hai
      final snapshot = await chats
          .where('users', isEqualTo: {friendId: friendId, currentId: currentId})
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        chatDocId = snapshot.docs.single.id;
      } else {
        final value = await chats.add({
          "created_on": FieldValue.serverTimestamp(),
          "last_msg": '',
          "users": {friendId: friendId, currentId: currentId},
          "toId": '',
          "fromId": '',
          "friend_name": friendName,
          "sender_name": senderName,
        });
        chatDocId = value.id;
      }

      isLoading(false);
    } catch (e) {
      debugPrint("ERROR CHAT $e");
    }
  }

  // Send Message
  sendMsg(String msg) {
    if (msg.trim().isNotEmpty) {
      chats.doc(chatDocId).update({
        "created_on": FieldValue.serverTimestamp(),
        "last_msg": msg,
        "toId": friendId,
        "fromId": currentId
      });

      chats.doc(chatDocId).collection(messagesCollection).doc().set({
        "created_on": FieldValue.serverTimestamp(),
        "msg": msg,
        "uid": currentId
      });
    }
  }
}

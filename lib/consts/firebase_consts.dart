import 'package:e_mart_app/consts/consts.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
User? currentUser = auth.currentUser;

// collections
const usersCollection = "users";
const productCollection = "products";
const cartCollection = "cart";
const chatsCollection = "chats";
const messagesCollection = "messages";

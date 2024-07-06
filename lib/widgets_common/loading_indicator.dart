import 'package:e_mart_app/consts/consts.dart';

Widget loadingIndicator() {
  return CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(redColor),
  );
}

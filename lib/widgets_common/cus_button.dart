import 'package:e_mart_app/consts/consts.dart';

Widget cusButton({onPress, color, textColor, String? title}) {
  return ElevatedButton(
    onPressed: onPress,
    child: title!.text.color(textColor).fontFamily(bold).make(),
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      padding: const EdgeInsets.all(12),
    ),
  );
}

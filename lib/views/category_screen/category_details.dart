import 'package:e_mart_app/consts/consts.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
            appBar: AppBar(
      title: title!.text.fontFamily(bold).white.make(),
    )));
  }
}

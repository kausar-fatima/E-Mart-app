import 'package:e_mart_app/consts/consts.dart';
import 'package:e_mart_app/widgets_common/applogo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        // child: VxInlineBlock(
        //   children: [
        //     "VelocityX is Super".text.make().box.height(60).red500.make(),
        //     "VelocityX increase productivity".text.make().box.red500.make(),
        //     "VelocityX is Super".text.make().box.red500.make(),
        //     "VelocityX increase productivity".text.make().box.red500.make(),
        //     "VelocityX is Super".text.make().box.height(60).red500.make(),
        //     "VelocityX increase productivity".text.make().box.red500.make(),
        //     "VelocityX is Super".text.make().box.red500.make(),
        //     "VelocityX increase productivity".text.make().box.red500.make()
        //   ],
        //   verticalDirection: VerticalDirection.up,
        //   textBaseline: TextBaseline.ideographic,
        // ).scrollHorizontal(),
        child: "VelocityX"
            .text
            .make()
            .card
            .shadowColor(Colors.red)
            .elevation(10)
            .hexColor("#cfcfcf")
            .make(),
      ),
      // body: Center(
      //   child: Column(
      //     children: [
      //       Align(
      //         alignment: Alignment.topLeft,
      //         child: Image.asset(
      //           icSplashBg,
      //           width: 300,
      //         ),
      //       ),
      //       20.heightBox,
      //       applogoWidget(),
      //       10.heightBox,
      //       appname.text.size(22).fontFamily(bold).white.make(),
      //       5.heightBox,
      //       appversion.text.white.make(),
      //       const Spacer(),
      //       credits.text.white.fontFamily(semibold).make(),
      //       30.heightBox,
      //     ],
      //   ),
      // ),
    );
  }
}

import 'package:e_mart_app/consts/consts.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: SizedBox(
        height: 60,
        child: cusButton(
            onPress: () {},
            color: redColor,
            textColor: whiteColor,
            title: "Place my order"),
      ),
      appBar: AppBar(
        title: "Choose Payment Method"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .make(),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: List.generate(paymentMethods.length, (index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.only(bottom: 8),
              child: Image.asset(
                PaymentMethodsList[index],
                width: double.infinity,
                fit: BoxFit.cover,
                height: 100,
              ),
            );
          }),
        ),
      ),
    );
  }
}

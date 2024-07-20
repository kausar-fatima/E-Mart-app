import 'package:e_mart_app/consts/consts.dart';
import 'package:e_mart_app/views/orders_screen/orders_details.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "My Orders".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
          stream: FirestoreServices.getAllOrders(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: loadingIndicator());
            } else if (snapshot.data!.docs.isEmpty) {
              return "No Orders Yet!".text.color(darkFontGrey).makeCentered();
            } else {
              var data = snapshot.data!.docs;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: "${index + 1}"
                        .text
                        .fontFamily(bold)
                        .color(darkFontGrey)
                        .xl
                        .make(),
                    title: data[index]['order_code']
                        .toString()
                        .text
                        .color(redColor)
                        .fontFamily(semibold)
                        .make(),
                    subtitle: data[index]['total_amount']
                        .toString()
                        .numCurrency
                        .text
                        .fontFamily(bold)
                        .make(),
                    trailing: IconButton(
                      onPressed: () {
                        Get.to(
                          () => OrdersDetails(
                            data: data[index],
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: darkFontGrey,
                      ),
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}

import 'package:e_mart_app/consts/consts.dart';
import 'package:e_mart_app/views/orders_screen/components/order_place_details.dart';
import 'package:e_mart_app/views/orders_screen/components/order_status.dart';
import 'package:intl/intl.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key, this.data});

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Order Details"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            orderStatus(
                color: redColor,
                icon: Icons.done,
                title: "Placed",
                showDone: data['order_placed']),
            orderStatus(
                color: Colors.blue,
                icon: Icons.thumb_up,
                title: "Confirmed",
                showDone: data['order_confirmed']),
            orderStatus(
                color: Colors.yellow,
                icon: Icons.car_crash,
                title: "On Delivery",
                showDone: data['order_on_delivery']),
            orderStatus(
                color: Colors.purple,
                icon: Icons.done_all_rounded,
                title: "Delivered",
                showDone: data['order_delivered']),
            Divider(),
            10.heightBox,
            Column(
              children: [
                OrderPlaceDetails(
                    d1: data['order_code'],
                    d2: data['shipping_method'],
                    title1: "Order Code",
                    title2: "Shipping Method"),
                OrderPlaceDetails(
                    // d1: Intl.DateFormat()
                    //     .add_yMd
                    //     .format((data['order_date'].toDate())),
                    d1: data['order_date'].toDate().toString(),
                    d2: data['payment_method'],
                    title1: "Order Date",
                    title2: "Payment Method"),
                OrderPlaceDetails(
                    d1: "Unpaid",
                    d2: "Order Placed",
                    title1: "Payment Status",
                    title2: "Delivery Status"),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Shipping Address".text.fontFamily(semibold).make(),
                          "${data['order_by_name']}".text.make(),
                          "${data['order_by_email']}".text.make(),
                          "${data['order_by_address']}".text.make(),
                          "${data['order_by_city']}".text.make(),
                          "${data['order_by_state']}".text.make(),
                          "${data['order_by_phone']}".text.make(),
                          "${data['order_by_postalcode']}".text.make(),
                        ],
                      ),
                      SizedBox(
                        width: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Total Amount".text.fontFamily(semibold).make(),
                            "${data['total_amount']}"
                                .text
                                .color(redColor)
                                .fontFamily(bold)
                                .make(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ).box.outerShadowMd.white.make(),
            Divider(),
          ],
        ),
      ),
    );
  }
}

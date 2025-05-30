import 'package:e_mart_app/consts/consts.dart';
import 'package:e_mart_app/views/orders_screen/components/order_place_details.dart';
import 'package:e_mart_app/views/orders_screen/components/order_status.dart';

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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              orderStatus(
                  color: redColor,
                  icon: Icons.done,
                  title: "Placed",
                  showDone: data['order_placed'] ?? false),
              orderStatus(
                  color: Colors.blue,
                  icon: Icons.thumb_up,
                  title: "Confirmed",
                  showDone: data['order_confirmed'] ?? false),
              orderStatus(
                  color: Colors.yellow,
                  icon: Icons.car_crash,
                  title: "On Delivery",
                  showDone: data['order_on_delivery'] ?? false),
              orderStatus(
                  color: Colors.purple,
                  icon: Icons.done_all_rounded,
                  title: "Delivered",
                  showDone: data['order_delivered'] ?? false),
              const Divider(),
              10.heightBox,
              Column(
                children: [
                  OrderPlaceDetails(
                      d1: "${data['order_code'] ?? 'Unpaid'}",
                      d2: "${data['shipping_method'] ?? 'Order placed'}",
                      title1: "Order Code",
                      title2: "Shipping Method"),
                  OrderPlaceDetails(
                      // d1: Intl.DateFormat()
                      //     .add_yMd
                      //     .format((data['order_date'].toDate())),
                      d1: data['order_date'].toString().toDate().toString(),
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
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Shipping Address"
                                  .text
                                  .fontFamily(semibold)
                                  .make(),
                              "${data['order_by_name']}".text.make(),
                              "${data['order_by_email']}".text.make(),
                              "${data['order_by_address']}".text.make(),
                              "${data['order_by_city']}".text.make(),
                              "${data['order_by_state']}".text.make(),
                              "${data['order_by_phone']}".text.make(),
                              "${data['order_by_postalcode']}".text.make(),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Total Amount".text.fontFamily(semibold).make(),
                              data['total_amount']
                                  .toString()
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
              const Divider(),
              10.heightBox,
              "Order Product"
                  .text
                  .size(16)
                  .color(darkFontGrey)
                  .fontFamily(semibold)
                  .makeCentered(),
              10.heightBox,
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(
                  data['orders'].length,
                  (index) {
                    final color = data['orders'][index]['color'];
                    // return SizedBox();
                    final title = data['orders'][index]['title'] ?? '';
                    final tprice = data['orders'][index]['tprice'] ?? 0;
                    final qty = data['orders'][index]['qty'] ?? 0;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OrderPlaceDetails(
                            title1: title,
                            title2: tprice.toString(),
                            d1: qty.toString(),
                            d2: "Refundaable"),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            width: 30,
                            height: 20,
                            color: Color(int.parse(color)),
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                ).toList(),
              )
                  .box
                  .outerShadowMd
                  .white
                  .margin(const EdgeInsets.only(bottom: 4))
                  .make(),
              20.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}

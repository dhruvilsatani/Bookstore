import 'package:book_store/pages/checkout/customtext.dart';
import 'package:book_store/pages/orderpage/ordercontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class Orderpage extends StatelessWidget {
  final Ordercontroller ordercontroller = Get.put(Ordercontroller());
  Orderpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: Obx(() {
              if (ordercontroller.orderlist.isEmpty) {
                return Orderpage1();
              } else {
                return Order3();
              }
            }),
          )
        ],
      ),
    );
  }
}

class Orderpage1 extends StatelessWidget {
  const Orderpage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class OrderPage2 extends StatefulWidget {
  @override
  State<OrderPage2> createState() => _OrderPage2State();
}

class _OrderPage2State extends State<OrderPage2> {
  final Ordercontroller ordercontroller = Get.put(Ordercontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 130,
            child: Padding(
              padding: EdgeInsets.only(bottom: 24, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  CustomText(
                    text: 'Order History',
                    fontSize: 20,
                    alignment: Alignment.bottomCenter,
                  ),
                  Container(
                    width: 24,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GetBuilder<Ordercontroller>(
              init: Get.put<Ordercontroller>(Ordercontroller()),
              builder: (controller) => ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Obx(
                      () => Card(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: controller
                                          .orderlist[index]!.orderDate
                                          .toString(),
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Obx(
                                      () =>
                                          // Text(ordercontroller
                                          //         .orderlist.first!.status
                                          //         .toString())
                                          CustomText(
                                        text:
                                            controller.orderlist[index]!.status,
                                        color: controller
                                                    .orderlist[index]!.status ==
                                                "cancelled"
                                            ? Colors.red
                                            : Colors.green,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Divider(
                                          thickness: 1,
                                          color: Colors.grey.shade200,
                                        ),
                                        CustomText(
                                          text: controller.orderlist[index]!
                                              .customerDetail.locality,
                                        ),
                                        CustomText(
                                          text: controller.orderlist[index]!
                                              .customerDetail.city,
                                        ),
                                        CustomText(
                                          text: controller.orderlist[index]!
                                              .customerDetail.state,
                                        ),
                                        CustomText(
                                          text: controller.orderlist[index]!
                                              .customerDetail.zipcode
                                              .toString(),
                                        ),
                                        Divider(
                                          thickness: 3,
                                          color: Colors.grey.shade200,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 70,
                                      width: 70,
                                      child: Card(
                                        child: Image.network(
                                          controller.orderlist[index]!
                                              .bookDetail.image
                                              .toString(),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: 'Total Billed',
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    CustomText(
                                      text:
                                          '\₹${controller.orderlist[index]!.price}',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 40,
                                  width: 330,
                                  color: Colors.white,
                                  child: CupertinoButton(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(3),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          "Cancel".text.black.bold.make(),
                                        ],
                                      ),
                                      onPressed: () {
                                        controller.deleteorder(
                                            controller.orderlist[index]!.id);
                                      }),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  thickness: 1,
                  color: Colors.grey.shade200,
                ),
                itemCount: controller.orderlist.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Order3 extends StatefulWidget {
  const Order3({super.key});

  @override
  State<Order3> createState() => _Order3State();
}

class _Order3State extends State<Order3> {
  final Ordercontroller controller = Get.put(Ordercontroller());
  Future refresh() async {
    controller.fetchorder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 130,
            child: Padding(
              padding: EdgeInsets.only(bottom: 24, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  CustomText(
                    text: 'Order History',
                    fontSize: 20,
                    alignment: Alignment.bottomCenter,
                  ),
                  Container(
                    width: 24,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: refresh,
              child: Obx(
                () => ListView.separated(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: controller
                                          .orderlist[index]!.orderDate
                                          .toString(),
                                      color: Colors.grey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Divider(
                                          thickness: 1,
                                          color: Colors.black,
                                        ),
                                        Row(
                                          children: [
                                            CustomText(
                                              text: 'status :',
                                              fontWeight: FontWeight.bold,
                                            ),
                                            CustomText(
                                              text: controller
                                                  .orderlist[index]!.status,
                                              color: controller
                                                          .orderlist[index]!
                                                          .status ==
                                                      "cancelled"
                                                  ? Colors.red
                                                  : Colors.green,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                        CustomText(
                                          text: 'shipping Address :',
                                          fontWeight: FontWeight.bold,
                                        ),
                                        CustomText(
                                          text:
                                              '${controller.orderlist[index]!.customerDetail.locality},${controller.orderlist[index]!.customerDetail.city}',
                                        ),
                                        CustomText(
                                          text:
                                              '${controller.orderlist[index]!.customerDetail.zipcode},${controller.orderlist[index]!.customerDetail.state}',
                                        ),
                                        Row(
                                          children: [
                                            CustomText(
                                              text: "price per book :",
                                              fontWeight: FontWeight.bold,
                                            ),
                                            CustomText(
                                              text: controller.orderlist[index]!
                                                  .bookDetail.discountedPrice
                                                  .toString(),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            CustomText(
                                              text: "quantity :",
                                              fontWeight: FontWeight.bold,
                                            ),
                                            CustomText(
                                              text: controller
                                                  .orderlist[index]!.quantity
                                                  .toString(),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          thickness: 3,
                                          color: Colors.grey.shade200,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 130,
                                      width: 100,
                                      child: Card(
                                        child: Image.network(
                                          controller.orderlist[index]!
                                              .bookDetail.image
                                              .toString(),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: 'Total Billed',
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    CustomText(
                                      text:
                                          '\₹${controller.orderlist[index]!.price}',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 40,
                                  width: 330,
                                  color: Colors.white,
                                  child: CupertinoButton(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(3),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          "Cancel".text.black.bold.make(),
                                        ],
                                      ),
                                      onPressed: () {
                                        controller.deleteorder(
                                            controller.orderlist[index]!.id);
                                      }),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    thickness: 1,
                    color: Colors.grey.shade200,
                  ),
                  itemCount: controller.orderlist.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
































// import 'package:book_store/pages/orderpage/ordercontroller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class OrderPage extends StatelessWidget {
//   final Ordercontroller orderController = Get.put(Ordercontroller());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Order Page'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Obx(
//               () => ListView.builder(
//                 itemCount: orderController.orderlist.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final item = orderController.orderlist[index];
//                   return Card(
//                     margin: EdgeInsets.only(bottom: 10, top: 10),
//                     child: ListTile(
//                       leading: Card(
//                         child: Image.network(
//                           item!.cartDetail.bookDetail.image.toString(),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       title: Text(item.cartDetail.bookDetail.name),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('\$${item.cartDetail.price.toStringAsFixed(2)}'),
//                           Text(item.customerDetail.city),
//                         ],
//                       ),
//                       trailing: IconButton(
//                         icon: Icon(Icons.cancel),
//                         onPressed: () => orderController.deleteorder(item.id),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:book_store/api/models/cart.dart';
import 'package:book_store/api/models/customer.dart';
import 'package:book_store/pages/account/controller/profilecontroller.dart';
import 'package:book_store/pages/address/addresscontroller.dart';
import 'package:book_store/pages/cartpage/controller/cartcontroller.dart';
import 'package:book_store/pages/checkout/custombutton.dart';
import 'package:book_store/pages/checkout/customtext.dart';
import 'package:book_store/pages/checkout/textformfield.dart';
import 'package:book_store/pages/mainpage.dart';
import 'package:book_store/pages/orderpage/ordercontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:pay/pay.dart';

class CheckoutMain extends StatelessWidget {
  const CheckoutMain({super.key});

  @override
  Widget build(BuildContext context) {
    final Addresscontroller addresscontroller = Get.put(Addresscontroller());

    final Ordercontroller ordercontroller = Get.put(Ordercontroller());

    final Profilecontroller profilecontroller = Get.put(Profilecontroller());

    final Cartcontroller cartcontroller = Get.put(Cartcontroller());

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (profilecontroller.profilelist.value!.id != null &&
                  cartcontroller.cartlist.isNotEmpty &&
                  addresscontroller.customerlist.isNotEmpty) {
                return CheckoutView();
              } else {
                return CheckoutView1();
              }
            }),
          ),
        ],
      ),
    );
  }
}

class CheckoutView1 extends StatelessWidget {
  const CheckoutView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

class CheckoutView extends StatefulWidget {
  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  var _razorpay = Razorpay();

  final Addresscontroller addresscontroller = Get.put(Addresscontroller());

  final Ordercontroller ordercontroller = Get.put(Ordercontroller());

  final Profilecontroller profilecontroller = Get.put(Profilecontroller());

  final Cartcontroller cartcontroller = Get.put(Cartcontroller());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(cartcontroller.cartlist.length);

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    addresscontroller.selectedaddress.value =
        addresscontroller.customerlist.first;
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    ordercontroller.addorder(
      profilecontroller.profilelist.value!.id,
      addresscontroller.selectedaddress.value!.id,
      cartcontroller.cartlist,
    );
    await Get.dialog(
      AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle_outline_outlined,
                color: Colors.blue,
                size: 200,
              ),
              CustomText(
                text: 'Order Submitted',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                'Done',
                () {
                  cartcontroller.clearcart();
                  // await cartcontroller.clearcart();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Mainpage()));
                },
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    Text("try after some time");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: 100,
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
                  text: 'Checkout',
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
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(right: 16, left: 16, bottom: 24),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),

                  ListViewProducts(),

                  SizedBox(
                    height: 50,
                  ),
                  "Select your shipping address from here.."
                      .text
                      .bold
                      .xl2
                      .make()
                      .pOnly(left: 4),
                  SizedBox(
                    height: 4,
                  ),
                  ListViewaddress(),
                  SizedBox(
                    height: 4,
                  ),
                  "* order and get discount on next order".text.xl2.make(),
                  SizedBox(
                    height: 100,
                  ),

                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          width: 360,
                          child: CupertinoButton(
                              color: Colors.black,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  "Confirm With COD".text.make(),
                                  Icon(Icons.check_circle)
                                ],
                              ),
                              onPressed: () {
                                ordercontroller.addorder(
                                  profilecontroller.profilelist.value!.id,
                                  addresscontroller.selectedaddress.value!.id,
                                  cartcontroller.cartlist,
                                );

                                Get.dialog(
                                  AlertDialog(
                                    content: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.check_circle_outline_outlined,
                                            color: Colors.blue,
                                            size: 200,
                                          ),
                                          CustomText(
                                            text: 'Order Submitted',
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                            alignment: Alignment.center,
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                          CustomButton(
                                            'Done',
                                            () {
                                              cartcontroller.clearcart();
                                              //cartcontroller.clearcart();
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Mainpage()));
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  barrierDismissible: false,
                                );
                              }),
                        ),
                      )
                    ],
                  ),
                  // CustomButton(
                  //   'COD',
                  //   () async {
                  //     ordercontroller.addorder(
                  //       profilecontroller.profilelist.value!.id,
                  //       addresscontroller.selectedaddress.value!.id,
                  //       cartcontroller.cartlist,
                  //     );
                  //     Get.dialog(
                  //       AlertDialog(
                  //         content: SingleChildScrollView(
                  //           child: Column(
                  //             mainAxisSize: MainAxisSize.min,
                  //             children: [
                  //               Icon(
                  //                 Icons.check_circle_outline_outlined,
                  //                 color: Colors.blue,
                  //                 size: 200,
                  //               ),
                  //               CustomText(
                  //                 text: 'Order Submitted',
                  //                 fontSize: 24,
                  //                 fontWeight: FontWeight.bold,
                  //                 color: Colors.blue,
                  //                 alignment: Alignment.center,
                  //               ),
                  //               SizedBox(
                  //                 height: 40,
                  //               ),
                  //               CustomButton(
                  //                 'Done',
                  //                 () {
                  //                   Navigator.push(
                  //                       context,
                  //                       MaterialPageRoute(
                  //                           builder: (context) => Mainpage()));
                  //                 },
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //       barrierDismissible: false,
                  //     );
                  //     // }
                  //   },
                  // ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          width: 360,
                          child: CupertinoButton(
                              color: Colors.black,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  "Pay Amount Online".text.bold.make(),
                                ],
                              ),
                              onPressed: () {
                                var options = {
                                  'key': 'rzp_test_jVyngBLd59ivfq',
                                  'amount': (int.parse(cartcontroller
                                              .carttotallist.first!.grandTotal
                                              .toString()) *
                                          100)
                                      .toString(), //in the smallest currency sub-unit.
                                  'name': 'Book Store',
                                  // 'order_id':
                                  //     'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
                                  'description': 'Books',
                                  'timeout': 60, // in seconds
                                  'prefill': {
                                    'contact': '9123456789',
                                    'email': 'dhruvilsatani@gmail.com'
                                  }
                                };
                                _razorpay.open(options);
                              }),
                        ),
                      )
                      // Container(
                      //   decoration: BoxDecoration(color: Colors.blue),
                      //   child: Center(child: "Pay".text.make()),
                      // )
                      // GooglePayButton(
                      //   paymentConfigurationAsset: ,
                      //   // paymentConfiguration:
                      //   //     PaymentConfiguration.fromJsonString(
                      //   //       ),
                      //           // "/assets/images/gpay.json"
                      //   onPaymentResult: (data) {
                      //     print(data);
                      //   },
                      //   paymentItems: paymentItems,
                      //   width: 250,
                      //   height: 200,
                      // ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _razorpay.clear();
    super.dispose();
  }
}

class ListViewProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Cartcontroller>(
        builder: (controller) => Column(
              children: [
                Container(
                  height: 180,
                  child: Obx(
                    () => ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.cartlist.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white,
                                ),
                                height: 120,
                                width: 120,
                                child: Image.network(
                                  controller.cartlist[index]!.bookDetail!.image
                                      .toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              CustomText(
                                text: controller
                                    .cartlist[index]!.bookDetail!.name
                                    .toString(),
                                fontSize: 14,
                                maxLines: 1,
                              ),
                              CustomText(
                                text: '\₹${controller.cartlist[index]!.price}',
                                fontSize: 14,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 15,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text:
                          'TOTAL: ${controller.carttotallist.first!.grandTotal.toString()} ',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    CustomText(
                      // text: '\$${controller.totalPrice.toString()}',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ],
            ));
  }
}

class ListViewaddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Addresscontroller>(
        builder: (controller) => Column(
              children: [
                Card(
                  shadowColor: Colors.black,
                  child: Container(
                    //color: Colors.white,
                    height: 150,
                    child: Obx(
                      () => ListView.separated(
                          padding: EdgeInsets.only(top: 5),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Obx(
                              () => ListTile(
                                title: Text(
                                  controller.customerlist[index]!.name
                                      .toString(),
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                subtitle: Text(
                                  '${controller.customerlist[index]!.city.toString()},${controller.customerlist[index]!.locality.toString()},${controller.customerlist[index]!.state.toString()}',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                leading: Radio(
                                  value: controller.customerlist[index],
                                  groupValue: controller.selectedaddress.value,
                                  onChanged: (value) =>
                                      controller.setaddress(value!),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 2,
                            );
                          },
                          itemCount: controller.customerlist.length),
                    ),
                  ),
                )
              ],
            ));
  }
}

import 'package:book_store/api/models/customer.dart';
import 'package:book_store/pages/account/controller/profilecontroller.dart';
import 'package:book_store/pages/address/addresscontroller.dart';
import 'package:book_store/pages/address/addressform.dart';
import 'package:book_store/pages/checkout/customtext.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class Addressscreen extends StatefulWidget {
  const Addressscreen({super.key});

  @override
  State<Addressscreen> createState() => _AddressscreenState();
}

class _AddressscreenState extends State<Addressscreen> {
  final Profilecontroller profilecontroller = Get.put(Profilecontroller());
  final Addresscontroller addresscontroller = Get.put(Addresscontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (profilecontroller.profilelist.value!.id != null) {
                return Addressscreen2();
              } else {
                return Addressscreen1();
              }
            }),
          ),
        ],
      ),
    );
    ;
  }
}

class Addressscreen1 extends StatelessWidget {
  const Addressscreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            "Please check  your are login ?"
                .text
                .xl3
                .bold
                .bold
                .bold
                .maxLines(5)
                .make()
                .centered()
                .pOnly(left: 0)
                .shimmer(),
            // "OR"
            //     .text
            //     .xl3
            //     .bold
            //     .bold
            //     .bold
            //     .maxLines(5)
            //     .make()
            //     .centered()
            //     .pOnly(left: 0)
            //     .shimmer(),
            // "ADD Address in your account  "
            //     .text
            //     .xl3
            //     .bold
            //     .bold
            //     .bold
            //     .maxLines(5)
            //     .make()
            //     .centered()
            //     .pOnly(left: 0)
            //     .shimmer(),
          ],
        ),
      ),
      //  bottomNavigationBar: CheckoutCart(),
    );
    ;
  }
}

class Addressscreen2 extends StatefulWidget {
  Addressscreen2({super.key});

  @override
  State<Addressscreen2> createState() => _Addressscreen2State();
}

class _Addressscreen2State extends State<Addressscreen2> {
  Addresscontroller addresscontroller = Get.put(Addresscontroller());
  Future refresh() async {
    addresscontroller.getaddress();
  }

  final _formKey = GlobalKey<FormState>();
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
                    text: 'Addresses',
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
            child: RefreshIndicator(
              onRefresh: refresh,
              child: Obx(
                () => ListView.builder(
                  scrollDirection: Axis.vertical,
                  clipBehavior: Clip.hardEdge,
                  itemCount: addresscontroller.customerlist.length,
                  itemBuilder: (context, index) {
                    final customer = addresscontroller.customerlist[index];
                    return Card(
                      shadowColor: Colors.black,
                      child: ListTile(
                          title: Text(customer!.name.toString()),
                          subtitle: Text(
                              '${customer.city.toString()}, ${customer.state.toString()} ${customer.zipcode.toString()}'),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () =>
                                addresscontroller.deleteaddress(customer.id),
                          ),
                          onTap: () {
                            Get.to(AddressFormScreen(
                              address: customer,
                            ));
                            //   _editaddress(context, customer);
                          }),
                    );
                  },
                ).pOnly(top: 0),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddressFormScreen());
          // addAdresss(context);
        },
        //_addAdresss(context),
        //_addAddress(context),
        child: Icon(Icons.add),
      ),
    );
  }
}

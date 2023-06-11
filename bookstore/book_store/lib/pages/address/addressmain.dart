import 'package:book_store/pages/address/addressscreen.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Address extends StatelessWidget {
  Address({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Container(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Addressscreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      'Add address',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        addressCard(size)
      ]),
    ));
  }

  Widget addressCard(Size size) {
    return Material(
      elevation: 5,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        width: size.width / 1.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "name",
              //controller.name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "address",
                //controller.address,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              "pincode",
              //controller.pincode,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: size.height / 30,
            ),
            GestureDetector(
              onTap: () {
                //  controller.onEdit();
              },
              child: Container(
                height: size.height / 18,
                width: size.width / 1.2,
                color: Colors.blueAccent,
                alignment: Alignment.center,
                child: const Text(
                  "Edit",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

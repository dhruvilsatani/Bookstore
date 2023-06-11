import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage(
                        'assets/images/14441bd8203e5573cb19a1e28437245b.jpg')),
                Text(
                  'Book Store',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      color: Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Ecommerce Plateform',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      letterSpacing: 2.5,
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                  width: 150,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.blue,
                    ),
                    title: Text(
                      '+919825312406',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 2, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.blue,
                    ),
                    title: Text(
                      'dhruvilsatani00@gmail.com',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

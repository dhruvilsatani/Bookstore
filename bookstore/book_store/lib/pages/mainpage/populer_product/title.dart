import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Sectiontitle extends StatelessWidget {
  final String title;
  final Function onpress;
  const Sectiontitle({super.key, required this.title, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          TextButton(
              onPressed: () {
                onpress();
              },
              child: Text(
                "see more",
                style: TextStyle(color: Colors.grey),
              )),
        ],
      ),
    );
  }
}

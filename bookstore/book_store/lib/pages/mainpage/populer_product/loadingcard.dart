import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';

class Loadingcard extends StatelessWidget {
  const Loadingcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 5, 10),
      child: Material(
        elevation: 8,
        shadowColor: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
        child: Shimmer.fromColors(
            child: Container(
              margin: EdgeInsets.all(10),
              width: 120,
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 0.9,
                    child: Container(
                      color: Colors.grey,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.symmetric(horizontal: 25),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 10),
                      child: Container(
                        height: 15,
                        color: Colors.grey,
                      ))
                ],
              ),
            ),
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white),
      ),
    );
  }
}

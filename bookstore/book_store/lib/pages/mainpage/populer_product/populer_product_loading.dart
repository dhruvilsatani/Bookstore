import 'package:book_store/pages/mainpage/populer_product/loadingcard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Populerproductloading extends StatelessWidget {
  const Populerproductloading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: 5,
          addAutomaticKeepAlives: true,
          itemBuilder: ((context, index) => Loadingcard())),
    );
  }
}

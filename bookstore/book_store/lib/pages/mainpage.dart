import 'package:book_store/pages/account/accountpage.dart';
import 'package:book_store/pages/category/category.dart';
import 'package:book_store/pages/mainpage/categories/categoryscreen.dart';
import 'package:book_store/pages/mainpage/homepage.dart';
import 'package:book_store/pages/productscreen/populerbook.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int _currentindex = 0;
  List<Widget> pagelist = [
    HomePage(),
    Productscreen(),
    Categoryscreen(),
    //populercategory(),
    Accountscreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: pagelist,
        index: _currentindex,
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  BottomNavigationBar _buildBottomNavigation() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color.fromARGB(255, 234, 223, 223),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      currentIndex: _currentindex,
      onTap: ((index) {
        setState(() {
          _currentindex = index;
        });
      }),
      selectedItemColor: Colors.purple,
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home_rounded),
        ),
        BottomNavigationBarItem(
          label: 'Book',
          icon: Icon(Icons.menu_book_rounded),
        ),
        BottomNavigationBarItem(
          label: 'Category',
          icon: Icon(Icons.category_outlined),
        ),
        BottomNavigationBarItem(
          label: 'Account',
          icon: Icon(Icons.person_outline),
        )
      ],
    );
  }
}

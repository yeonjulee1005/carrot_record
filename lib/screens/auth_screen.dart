import 'package:carrot_record/screens/start/address_page.dart';
import 'package:carrot_record/screens/start/intro.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  PageController _pageController = PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          IntroPage(_pageController),
          AddressPage(),
          Container(color: Colors.accents[2],),
          Container(color: Colors.accents[5],),
        ]
      ),
    );
  }
}

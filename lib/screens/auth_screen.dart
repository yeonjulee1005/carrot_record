import 'package:carrot_record/screens/start/intro.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          IntroPage(),
          Container(color: Colors.accents[2],),
          Container(color: Colors.accents[5],),
        ]
      ),
    );
  }
}

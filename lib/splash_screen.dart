
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExtendedImage.asset('assets/images/logo.png', width: 100, height: 100,),
              CircularProgressIndicator(
                color: Colors.redAccent,
              )
            ],
          )),
    );
  }
}
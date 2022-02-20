import 'package:carrot_record/utils/logger.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  void onButtonClick() {
    logger.d('on text button Clicked!');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('당근 마켓',
                style: TextStyle(
                    fontSize: 36,
                    color: Color(0xffD98442),
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
            ExtendedImage.asset('assets/images/carrot_intro.png'),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('우리 동네 중고 직거래 당근마켓',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('''당근마켓은 동네 직거래 마켓이에요.
내 동네를 설정하고 시작해보세요.''',
                style: TextStyle(
                    fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: onButtonClick,
                      child: const Text('내 동내 설정하고 시작하기',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                        ),
                        textAlign: TextAlign.center,
                      ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.teal)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

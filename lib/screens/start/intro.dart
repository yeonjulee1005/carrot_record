import 'package:carrot_record/utils/logger.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  PageController controller;
  IntroPage(this.controller, {Key? key}) : super(key: key);

  void onButtonClick() {
    controller.animateToPage(
        1, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    logger.d('on text button Clicked!');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint){

        Size size = MediaQuery.maybeOf(context)!.size;

        final imgSize = size.width - 32;
        final sizePosImg = imgSize * 0.1;

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('당근 마켓',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: imgSize,
                  height: imgSize,
                  child: Stack(
                    children: [
                      ExtendedImage.asset('assets/images/carrot_intro.png'),
                      Positioned(
                          width: sizePosImg,
                          left: imgSize*0.45,
                          height: sizePosImg,
                          top: imgSize*0.45,
                          child: ExtendedImage.asset('assets/images/carrot_intro_pos.png')
                      ),
                    ],
                  ),
                ),
                Text('우리 동네 중고 직거래 당근마켓',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                Text('''당근마켓은 동네 직거래 마켓이에요.
내 동네를 설정하고 시작해보세요.''',
                  style: TextStyle(
                      fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                        onPressed: onButtonClick,
                        child: Text('내 동내 설정하고 시작하기',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          ),
                          textAlign: TextAlign.center,
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor)
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:carrot_record/constants/common_size.dart';
import 'package:carrot_record/states/user_provider.dart';
import 'package:carrot_record/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntroPage extends StatelessWidget {
  PageController controller;

  IntroPage(this.controller, {Key? key}) : super(key: key);

  void onButtonClick() async {
    controller.animateToPage(
        1, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    logger.d('on text button Clicked!');
  }

  @override
  Widget build(BuildContext context) {
    logger.d('current user state: ${context.read<UserProvider>().userState}');
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.maybeOf(context)!.size;

        final imgSize = size.width - 32;
        final sizePosImg = imgSize * 0.1;

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: common_padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.all(common_small_padding),
                    child: Text(
                      '당근 마켓',
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: imgSize,
                    height: imgSize,
                    child: Stack(
                      children: [
                        ExtendedImage.asset('assets/images/carrot_intro.png'),
                        Positioned(
                            width: sizePosImg,
                            left: imgSize * 0.45,
                            height: sizePosImg,
                            top: imgSize * 0.45,
                            child: ExtendedImage.asset(
                                'assets/images/carrot_intro_pos.png')
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(common_small_padding),
                    child: Text(
                      '우리 동네 중고 직거래 당근마켓',
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(common_small_padding),
                    child: Text(
                      '''당근마켓은 동네 직거래 마켓이에요.
내 동네를 설정하고 시작해보세요.''',
                      style: Theme.of(context).textTheme.subtitle1
                      //.copyWith(color: Colors.red),// 테마색 바꾸고 싶을때
                      ,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(common_small_padding),
                        child: TextButton(
                            onPressed: onButtonClick,
                            child: const Text(
                              '내 동내 설정하고 시작하기',
                              style: TextStyle(
                                fontFamily: 'Pretendard',
                                  fontSize: 20, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            style: TextButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
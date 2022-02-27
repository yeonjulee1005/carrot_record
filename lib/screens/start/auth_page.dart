import 'package:carrot_record/constants/common_size.dart';
import 'package:carrot_record/states/user_provider.dart';
import 'package:carrot_record/utils/logger.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

const auth_duration = Duration(milliseconds: 200);

class _AuthPageState extends State<AuthPage> {
  final inputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey
    )
  );

  TextEditingController _phoneNumberController = TextEditingController(
    text:"010"
  );

  TextEditingController _codeController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  VerificationStatus _verificationStatus = VerificationStatus.none;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;
        return IgnorePointer(
          ignoring: _verificationStatus == VerificationStatus.verifying,
          child: Form(
            key: _formKey,
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  '전화번호 로그인',
                  style: Theme.of(context).appBarTheme.titleTextStyle,
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(common_padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        ExtendedImage.asset('assets/images/padlock.png',
                        width: size.width*0.15,
                        height: size.width*0.15,),
                        SizedBox(
                          width: common_small_padding,
                        ),
                        Text('''당근마켓은 휴대폰 번호로 가입하세요.
번호는 안전하게 보관되며,
어디에도 공개되지 않아요.'''),
                      ],
                    ),
                    SizedBox(
                      height: common_padding,
                    ),
                    TextFormField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        MaskedInputFormatter(
                          "000 0000 0000"
                        )
                      ],
                      decoration: InputDecoration(
                        focusedBorder: inputBorder,
                        border: inputBorder,
                      ),
                      validator: (phoneNumber){
                        if (phoneNumber != null && phoneNumber.length == 13) {
                          return null;
                        } else {
                          // error
                          setState(() {
                            _verificationStatus = VerificationStatus.none;
                          });
                          return '전화번호 똑바로 입력해라..';
                        }
                      },
                    ),
                    SizedBox(
                      height: common_small_padding,
                    ),
                    TextButton(
                        onPressed: (){
                          if(_formKey.currentState != null) {
                            bool? passed = _formKey.currentState!.validate();
                            if (passed) {
                              setState(() {
                                _verificationStatus = VerificationStatus.codeSent;
                              });
                            }
                          }
                        },
                        child:
                        Text('인증문자 발송', style: TextStyle(
                          color: Colors.white
                        ),),
                    ),
                    SizedBox(
                      height: common_padding,
                    ),
                    AnimatedOpacity(
                      duration: auth_duration,
                      curve: Curves.easeInOut,
                      opacity: (_verificationStatus == VerificationStatus.none)?0:1,
                      child: AnimatedContainer(
                        duration: auth_duration,
                        height: getVerificationHeight(_verificationStatus),
                        child: TextFormField(
                          controller: _codeController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            MaskedInputFormatter(
                                "000000"
                            )
                          ],
                          decoration: InputDecoration(
                            focusedBorder: inputBorder,
                            border: inputBorder,
                          ),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: auth_duration,
                      curve: Curves.easeInOut,
                      height: getVerificationButtonHeight(_verificationStatus),
                      child: TextButton(
                          onPressed: (){
                            attemptVerify();
                          },
                          child:
                          (_verificationStatus == VerificationStatus.verifying)?
                          CircularProgressIndicator(color: Colors.white,):
                          Text('인증', style: TextStyle(
                            color: Colors.white
                          ),)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  double getVerificationHeight(VerificationStatus status) {
    switch(status) {

      case VerificationStatus.none:
        // TODO: Handle this case.
        return 0;
      case VerificationStatus.codeSent:
        // TODO: Handle this case.
      case VerificationStatus.verifying:
        // TODO: Handle this case.
      case VerificationStatus.verificationDone:
        // TODO: Handle this case.
        return 60 + common_small_padding;    }
  }

  double getVerificationButtonHeight(VerificationStatus status) {
    switch(status) {

      case VerificationStatus.none:
      // TODO: Handle this case.
        return 0;
      case VerificationStatus.codeSent:
      // TODO: Handle this case.
      case VerificationStatus.verifying:
      // TODO: Handle this case.
      case VerificationStatus.verificationDone:
      // TODO: Handle this case.
        return 48;    }
  }

  void attemptVerify () async {
    setState(() {
      _verificationStatus = VerificationStatus.verifying;
    });

    await Future.delayed(Duration(seconds: 1));

    setState(() {
      _verificationStatus = VerificationStatus.verificationDone;
    });
    
    context.read<UserProvider>().setUserAuth(true);
  }

  _getAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String address = prefs.getString('address')??"";
    logger.d('address shared from $address');
  }

}

enum VerificationStatus {
  none, codeSent, verifying, verificationDone,
}
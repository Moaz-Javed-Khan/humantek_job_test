import 'package:flutter/material.dart';
import 'package:humantek_test/features/login/presentation/widget/login_form_widget.dart';
import 'package:humantek_test/features/login/presentation/widget/login_screen_top_bg.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          LoginScreenTopBg(
            deviceWidth: deviceWidth,
            deviceHeight: deviceHeight,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: (deviceHeight * 0.06),
              right: 24.0,
              left: 24.0,
            ),
            child: const LoginFormWidget(),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:humantek_test/features/signup/presentation/widget/signup_form_widget.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Transform.translate(
            offset: Offset((deviceWidth * 0.38), -(deviceHeight * 0.36)),
            child: const CircleAvatar(
              backgroundColor: Colors.orange,
              radius: 2000,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: (deviceHeight * 0.001),
              right: 24.0,
              left: 24.0,
            ),
            child: const SignupFormWidget(),
          ),
        ],
      ),
    );
  }
}

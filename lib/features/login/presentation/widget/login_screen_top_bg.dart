import 'package:flutter/material.dart';

class LoginScreenTopBg extends StatelessWidget {
  const LoginScreenTopBg({
    super.key,
    required this.deviceWidth,
    required this.deviceHeight,
  });

  final double deviceWidth;
  final double deviceHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: Offset(-(deviceWidth * 0.40), -(deviceHeight * 0.11)),
          child: Transform.rotate(
            angle: 340,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.orange,
              ),
              width: 440,
              height: 440,
            ),
          ),
        ),
        Positioned(
          top: deviceHeight * (-0.05),
          right: deviceWidth * (0.20),
          child: Transform.rotate(
            angle: 340,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                    width: 12,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "WELCOME TO CHARITABILITY",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.0 * 2),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: Image.asset(
                "images/charitability.png",
              ),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: 16.0 * 2),
      ],
    );
  }
}

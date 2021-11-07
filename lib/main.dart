import 'package:flutter/material.dart';

const Color mainThemeColor = Color(0xFF272D8D);
void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: SplashPage()));
}

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: mainThemeColor,
        )
      ],
    );
  }
}

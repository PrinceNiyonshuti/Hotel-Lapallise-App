import 'package:flutter/material.dart';

const Color mainThemeColor = Color(0xFF272D8D);
void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: SplashPage()));
}

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // delay and navigate to List page
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ListPage()));
    });
    return Stack(
      children: [
        Container(
          color: mainThemeColor,
        ),
        Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.pool,
            color: Colors.white,
            size: 80,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: LinearProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Colors.white.withOpacity(0.4)),
          ),
        )
      ],
    );
  }
}

// Another landing page after splash
class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Welcome Home'),
      ),
    );
  }
}

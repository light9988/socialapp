import 'dart:async';
import 'package:flutter/material.dart';
import 'package:xhs/pages/home_page/home_page.dart';
import 'package:get/get.dart';
import 'package:xhs/pages/login_page/login_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Timer(Duration(seconds: 10), () {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //       builder: (_) => HomePage(),
    //     ),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      backgroundColor: Color(0xFFff2e4d),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Little Red Book\n',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  WidgetSpan(
                    child: SizedBox(height: 30),
                  ),
                  TextSpan(
                    text: 'Your Life Guide\n',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  WidgetSpan(
                    child: SizedBox(height: 100),
                  ),
                  TextSpan(
                    text: 'Log in to see more',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 30),
            Image.asset(
              "assets/images/qrcode.png",
              width: 200,
              height: 200,
            ),
            ElevatedButton(
            onPressed: () {
              Get.off(LoginPage());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, 
               minimumSize: Size(150, 50),
            ),
            child: Text(
              'Log In',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}

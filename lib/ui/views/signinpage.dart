import 'signin.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Login'),
            backgroundColor: Color.fromRGBO(56, 142, 60, 1)),
        body: Stack(children: [
          Container(
              child: Image.asset('assets/icons/titulo.png'),
              height: 400,
              width: 400,
              padding: EdgeInsets.only(left: 40, bottom: 100)),
          /*decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icons/titulo.png"),
                      fit: BoxFit.fill))
                      */ //BoxDecoration
          //Container
          SingleChildScrollView(
              child: Container(
                  child: SignInScreen(),
                  padding: EdgeInsets.all(12)) //Container
              ) //SingleChildScrollView
        ]));
  }
}

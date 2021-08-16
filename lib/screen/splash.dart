import 'package:flutter/material.dart';
import 'package:flutter_application_1/color.dart';
import 'package:flutter_application_1/screen/login.dart';
import 'dart:async';
class Splash  extends StatefulWidget {
  @override
  _State createState() => _State();
}
class _State extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 3000), (){
      Navigator.push( context , MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [green1,green2],end: Alignment.bottomCenter,begin: Alignment.topCenter),
        ),
        child: Center(
          child: Image.asset("assets/images/icon4white.png",height: 200)),
        
      )
    );
  }
}
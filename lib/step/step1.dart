import 'package:flutter/material.dart';
import 'package:flutter_application_1/step/step2.dart';
import 'package:google_fonts/google_fonts.dart';
class Step1 extends StatefulWidget {
  @override
  _Step1 createState() => _Step1();
}

class _Step1 extends State<Step1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFDFE9AC), width: 10),
        ),
        padding: const EdgeInsets.all(28.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'คำนวณ BMR',
                style: TextStyle(fontSize: 20),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image.asset(
                    "assets/images/male.png",
                    width: 150,
                  ),
                  new Image.asset(
                    "assets/images/female.png",
                    width: 150,
                  )
                ],
              ),
              Text(
                "อายุ",
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "น้ำหนัก",
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "ส่วนสูง",
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
              ),
              ElevatedButton(
                  child: Text(
                    "ถัดไป",
                    style: GoogleFonts.mitr(
                        fontSize: 25,
                        textStyle: TextStyle(color: Colors.white)),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Step2()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF97BE11),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
  final _formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: firebase,builder:(context,snapshot){
      switch (snapshot.connectionState){
        case ConnectionState.none:
        return Text("none");
        case ConnectionState.active:
        case ConnectionState.waiting:
        case ConnectionState.done:
          return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFDFE9AC), width: 10),
        ),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Text("สมัครสมาชิก",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.mitr(fontSize: 32)),
              Container(
                  margin: EdgeInsets.only(top: 20, right: 50, left: 50),
                  padding: EdgeInsets.only(left: 20),
                  color: Colors.grey[200],
                  child: TextFormField(
                    validator: MultiValidator([
                      EmailValidator(errorText: "email ไม่ถูกต้อง"),
                      RequiredValidator(errorText: "กรุณากรอก email")
                    ]),
                    onChanged: (val) {
                      setState(() => email = val);
                      },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: ("Email"),
                        hintStyle:
                            GoogleFonts.mitr(fontSize: 20, color: Colors.grey)),
                    keyboardType: TextInputType.emailAddress,
                  )),
              Container(
                  margin: EdgeInsets.only(top: 20, right: 50, left: 50),
                  padding: EdgeInsets.only(left: 20),
                  color: Colors.grey[200],
                  child: TextFormField(
                    validator:
                        RequiredValidator(errorText: "กรุณากรอก password"),
                    onChanged: (val) {
                      setState(() => password = val);
                      },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: ("Password"),
                        hintStyle:
                            GoogleFonts.mitr(fontSize: 20, color: Colors.grey)),
                    keyboardType: TextInputType.number,
                    obscureText: true,
                  )),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: Text(
                  "register",
                  style: GoogleFonts.mitr(
                      fontSize: 25, textStyle: TextStyle(color: Colors.white)),
                ),
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    print("email = ${email}");
                    print("password = ${password}");
                    try{
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: this.email, password: this.password);
                         Fluttertoast.showToast(msg: "สร้างบัญชีสำเร็จ",gravity: ToastGravity.CENTER);
                              Timer(const Duration(milliseconds: 3000), (){
                           Navigator.push( context , MaterialPageRoute(builder: (context) => LoginPage()));
                              });
                    }on FirebaseAuthException catch(e){
                        Fluttertoast.showToast(msg: e.message.toString(),gravity: ToastGravity.CENTER,timeInSecForIosWeb: 10);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF97BE11),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ],
          ),
        ),
      ),
    );
      }
  });
}
}

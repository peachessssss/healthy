import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/register.dart';
import 'package:flutter_application_1/step/step1.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Color(0xFF97BE11),
              ),
            ),
            Expanded(
              child: Container(
                  child: Column(children: <Widget>[
                _textinput(hint: "Email"),
                _textinput(hint: "Password"),
                Container(
                    child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Step1()));
                  },
                  child: Text("Forgot Password?",
                      style: GoogleFonts.mitr(fontSize: 15)),
                )),
                ElevatedButton(
                  child: Text(
                    "Log in",
                    style: GoogleFonts.mitr(
                        fontSize: 25,
                        textStyle: TextStyle(color: Colors.white)),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF97BE11),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
                SizedBox(
                  height: 10,
                ),
                SignInButton(Buttons.Google, onPressed: () {}),
                SignInButton(Buttons.FacebookNew, onPressed: () {}),
              ])),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Row(
                  children: [
                    Text("Register",
                        style: GoogleFonts.mitr(
                            fontSize: 15, color: Colors.white)),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: Text(
                          "Click",
                          style: GoogleFonts.mitr(
                              fontSize: 15, color: Colors.white),
                        )),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
          ],
        ),
      ),
    );
  }

  Widget _textinput({controller, hint}) {
    return Container(
      margin: EdgeInsets.only(top: 20, right: 50, left: 50),
      padding: EdgeInsets.only(left: 20),
      color: Colors.grey[200],
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: GoogleFonts.mitr(fontSize: 20, color: Colors.grey)),
      ),
    );
  }
}

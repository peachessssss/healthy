import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(Step2());
}
class Step2 extends StatefulWidget {
  @override
  _Step2 createState() => _Step2();
}

class _Step2 extends State<Step2> {
  var valueChoose;
  List listitem = [
    "ไม่ออกกำลังกาย",
    "1-3 วันต่อสัปดาห์",
    "3-5 วันต่อสัปดาห์",
    "6-7 วันต่อสัปดาห์",
    "ออกกำลังกายทุกวัน"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFDFE9AC), width: 10),
        ),
        child: new Column(children: [
          new Container(
            child: Text("คำนวน TDEE",
                textAlign: TextAlign.center,
                style: GoogleFonts.mitr(fontSize: 32)),
            margin: EdgeInsets.only(top: 120.0),
          ),
          //dropdown
          SizedBox(height: 30),
          new Container(
            padding: EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF97BE11), width: 3),
                borderRadius: BorderRadius.circular(10)),
            child: DropdownButton(
              underline: SizedBox(),
              icon: Icon(
                Icons.arrow_drop_down,
                color: Color(0xFF97BE11),
                size: 70,
              ),
              hint: Text('กิจกรรมที่ทำ'),
              value: valueChoose,
              onChanged: (newValue) {
                setState(() {
                  valueChoose = newValue;
                });
              },
              items: listitem.map((valueItem) {
                return DropdownMenuItem(
                  value: valueItem,
                  child: Text(valueItem,
                      style: GoogleFonts.mitr(
                          fontSize: 27, fontWeight: FontWeight.w300)),
                );
              }).toList(),
            ),
          ),
          //TextField น้ำหนัก
          new Container(
            padding: const EdgeInsets.only(top: 150.0, left: 50.0, right: 50.0),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: 'kg',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          new Container(
            // width: 100,
            padding: const EdgeInsets.only(left: 50.0, right: 50.0),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          new Container(
            child: ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text(
                "ถัดไป",
                style: GoogleFonts.mitr(
                    fontSize: 30, textStyle: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

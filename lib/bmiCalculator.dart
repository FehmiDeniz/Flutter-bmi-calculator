import 'dart:math';

import 'package:bmi/calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:bmi/user-info.dart';

class bmiCalc extends StatefulWidget {
  const bmiCalc({super.key});

  @override
  State<bmiCalc> createState() => _bmiCalcState();
}

class _bmiCalcState extends State<bmiCalc> {
  int current = 0;
  Color _B1color = Colors.blueGrey;
  Color _B2color = Colors.blueGrey;
  Color _B3color = Colors.blueGrey;
  Color _T1color = Colors.black;
  Color _T2color = Colors.black;
  Color _T3color = Colors.black;

  double age = 0;
  double height = 0;
  double weight = 0;
  double ortalama = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              width: 300,
              height: 70,
              child: Text(
                "Let's calculate your current BMI",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 300,
              height: 60,
              child: Text(
                "You can find out whether you are overweight, underweight or ideal weight.",
                style: TextStyle(
                    fontSize: 14, color: Colors.grey[800], letterSpacing: 1),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 90,
                  height: 40,
                  decoration: BoxDecoration(
                      color: _B1color,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black87)),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (_B1color == Colors.blueGrey &&
                            (current == 0 || current == 1)) {
                          _B1color = Colors.black;
                          _T1color = Colors.white;
                          current = 1;
                        } else if (current == 1) {
                          _B1color = Colors.blueGrey;
                          _T1color = Colors.black;
                          current = 0;
                        }
                      });
                    },
                    icon: Text(
                      "Female",
                      style: TextStyle(
                          color: _T1color, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Container(
                  width: 90,
                  height: 40,
                  decoration: BoxDecoration(
                      color: _B2color,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black87)),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (_B2color == Colors.blueGrey &&
                            (current == 0 || current == 2)) {
                          _B2color = Colors.black;
                          _T2color = Colors.white;
                          current = 2;

                          ;
                        } else if (current == 2) {
                          _B2color = Colors.blueGrey;
                          _T2color = Colors.black;
                          current = 0;
                        }
                      });
                    },
                    icon: Text(
                      "Male",
                      style: TextStyle(
                          color: _T2color, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Container(
                  width: 90,
                  height: 40,
                  decoration: BoxDecoration(
                      color: _B3color,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black87)),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (_B3color == Colors.blueGrey &&
                            (current == 0 || current == 3)) {
                          _B3color = Colors.black;
                          _T3color = Colors.white;
                          current = 3;
                        } else if (current == 3) {
                          _B3color = Colors.blueGrey;
                          _T3color = Colors.black;
                          current = 0;
                        }
                      });
                    },
                    icon: Text(
                      "Other",
                      style: TextStyle(
                          color: _T3color, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 70,
              width: double.infinity,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Age',
                  labelStyle: TextStyle(
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
                onChanged: (value) {
                  age = double.parse(value);
                },
              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  //suffixText: "Cm",
                  helperText: '(Cm)',
                  labelText: 'Height',
                  labelStyle: TextStyle(
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
                onChanged: (value) {
                  height = double.parse(value);
                },
              ),
            ),
            Container(
              height: 70,
              width: double.infinity,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Weight',
                  helperText: '(Kg)',
                  labelStyle: TextStyle(
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
                onChanged: (value) {
                  weight = double.parse(value);
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                ortalama = weight / pow(2, height / 100);
                calculator Calculator =
                    new calculator(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => info(
                      bmi: Calculator.Calculator(),
                      hesap: Calculator.getHesap(),
                      sonuc: Calculator.bilgi(),
                    ),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 80),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.teal[400],
                ),
                width: 350,
                height: 60,
                child: Text(
                  "CALCULATE BMI",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

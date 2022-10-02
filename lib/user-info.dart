import 'package:bmi/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'bmiCalculator.dart';

class info extends StatefulWidget {
  final String bmi;
  final String hesap;
  final String sonuc;

  const info(
      {super.key, required this.bmi, required this.hesap, required this.sonuc});

  @override
  State<info> createState() => _calcState();
}

class _calcState extends State<info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      body: Padding(
        padding: const EdgeInsets.only(left: 27),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white60),
              alignment: Alignment.topCenter,
              width: 340,
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    child: Text(
                      "Your BMI is",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    child: Text(
                      widget.bmi,
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 30),
                    alignment: Alignment.center,
                    width: 300,
                    height: 100,
                    child: Text(
                      textAlign: TextAlign.center,
                      widget.hesap,
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    child: Text(
                      widget.sonuc,
                      style:
                          TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => bmiCalc()),
                    (Route<dynamic> route) => false);
              },
              child: Container(
                //margin: EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue[900]),
                width: 300,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.replay,
                      color: Colors.white,
                    ),
                    Text(
                      "Start Over",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, unused_import, unnecessary_new, sort_child_properties_last

import 'package:bmi_calculator/brain.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'brain.dart';

class Result extends StatelessWidget {
  String bmi;
  String interpretation;
  String result;
  Result(
      {required this.bmi,
      required this.interpretation,
      required this.result,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21)),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0A0E21),
          elevation: 2.0,
          leading: Icon(Icons.menu),
          title: Text('BMI CALCULATOR', style: style1),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Your Result',
              style: style1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 240,
                  width: size.width,
                  child: Column(
                    children: [
                      Text(bmi),
                      Text(result),
                      Text(interpretation),
                    ],
                  )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                  child: Text(
                    'RE-CALCULATE',
                    style: kLargeButtonTextStyle,
                  ),
                ),
                color: kBottomContainerColour,
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.only(bottom: 20.0),
                width: double.infinity,
                height: kBottomContainerHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

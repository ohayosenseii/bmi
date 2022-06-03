// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:bmi_calculator/brain.dart';
import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'extractedwidget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double height = 172;
  double weight = 60;
  var age = 18;
  var gender = 'MALE';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        elevation: 2.0,
        leading: Icon(Icons.menu),
        title: Text('BMI CALCULATOR', style: style1),
        centerTitle: true,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SizedBox(),
            ),
            Container(
              height: 160,
              child: Row(
                children: [
                  //extracted widget
                  Expanded(
                    child: ResuseCard(
                        colour: gender == 'MALE'
                            ? kActiveCardColour
                            : kInactiveCardColour,
                        cardChild: CardChild(
                          icon: Icons.person,
                          text: 'MALE',
                        ),
                        onPress: () {
                          setState(() {
                            gender = 'MALE';
                          });
                        }),
                  ),

                  Expanded(
                    child: ResuseCard(
                        colour: gender == 'FEMALE'
                            ? kActiveCardColour
                            : kInactiveCardColour,
                        cardChild: CardChild(
                          icon: Icons.person,
                          text: 'FEMALE',
                        ),
                        onPress: () {
                          setState(() {
                            gender = 'FEMALE';
                          });
                        }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                    color: kInactiveCardColour,
                    borderRadius: BorderRadius.circular(06)),
                height: 160,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: style1,
                    ),
                    Text(
                      '${height.toString()} cm',
                      style: style1,
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                          value: height,
                          max: 200,
                          min: 50,
                          divisions: 200,
                          activeColor: kActiveCardColour,
                          inactiveColor: kActiveCardColour,
                          mouseCursor: MouseCursor.uncontrolled,
                          thumbColor: Colors.pink,
                          onChanged: (double value) {
                            setState(() {
                              height = value.round().toDouble();
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 160,
              width: size.width,
              child: Expanded(
                child: Row(
                  children: [
                    ResuseCard2(
                      colour: kInactiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE'),
                          Text(age.toString()),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RawMaterialButton(
                                  elevation: 0.0,
                                  child: Icon(Icons.close),
                                  onPressed: () {
                                    setState(() {
                                      (age--).toString();
                                    });
                                  },
                                  shape: CircleBorder(),
                                  fillColor: Color(0xFF4C4F5E),
                                ),
                                RawMaterialButton(
                                  elevation: 0.0,
                                  child: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      (age++).toString();
                                    });
                                  },
                                  shape: CircleBorder(),
                                  fillColor: Color(0xFF4C4F5E),
                                ),
                              ]),
                        ],
                      ),
                    ),
                    ResuseCard2(
                        colour: kInactiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT'),
                            Text(weight.toString()),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  RawMaterialButton(
                                    elevation: 0.0,
                                    child: Icon(Icons.close),
                                    onPressed: () {
                                      setState(() {
                                        (weight--).toString();
                                      });
                                    },
                                    shape: CircleBorder(),
                                    fillColor: Color(0xFF4C4F5E),
                                  ),
                                  RawMaterialButton(
                                    elevation: 0.0,
                                    child: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        (weight++).toString();
                                      });
                                    },
                                    shape: CircleBorder(),
                                    fillColor: Color(0xFF4C4F5E),
                                  ),
                                ]),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Brain ob = Brain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Result(
                              bmi: ob.calculate_bmi(),
                              interpretation: ob.getInterpretation(),
                              result: ob.getResult(),
                            )));
              },
              child: Container(
                // ignore: sort_child_properties_last
                child: Center(
                  child: Text(
                    'CALCULATE YOUR BMI!',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                color: kBottomContainerColour,
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.only(bottom: 20.0),
                width: double.infinity,
                height: kBottomContainerHeight,
              ),
            ),
            //END OF THE UI
          ],
        ),
      ),
    );
  }
}

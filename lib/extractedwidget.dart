// ignore_for_file: sort_child_properties_last, prefer_const_constructors, must_be_immutable, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';

class CardChild extends StatefulWidget {
  IconData icon;
  String text;
  CardChild({required this.icon, required this.text, Key? key})
      : super(key: key);

  @override
  State<CardChild> createState() => _CardChildState();
}

class _CardChildState extends State<CardChild> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(widget.icon),
      SizedBox(
        height: 15,
      ),
      Text(widget.text),
    ]);
  }
}

class ResuseCard extends StatelessWidget {
  Color colour;
  Widget cardChild;
  void Function() onPress;
  ResuseCard(
      {required this.colour,
      required this.cardChild,
      required this.onPress,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class ResuseCard2 extends StatelessWidget {
  Color colour;
  Widget cardChild;
  ResuseCard2({required this.colour, required this.cardChild, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

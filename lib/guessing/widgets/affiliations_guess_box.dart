import 'package:flutter/material.dart';

class AffiliationsGuessBox extends StatelessWidget {
  const AffiliationsGuessBox({super.key, required this.value, required this.type,});

  final String value;
  final String type;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: width * 0.25,
      height: height * 0.1,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(
          color: Colors.black,
          width: 3,
        ),
      ),
      child: Column(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(color: Colors.black),
          ),
          Text(
            type,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
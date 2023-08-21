import 'package:flutter/material.dart';

class CustomTextView extends StatelessWidget{

  final String displayText;

  const CustomTextView({super.key, required this.displayText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:Text(
            displayText,
            style: TextStyle(
                fontSize: 28,
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                letterSpacing: 8,
                wordSpacing: 20,
            ),
          )
      ),
    );
  }
}
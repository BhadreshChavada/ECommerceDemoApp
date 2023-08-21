import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, this.textColor = Colors.black,this.bgColor = Colors.grey,this.title = ""});
  final Function onTap;
  final Color textColor;
  final Color bgColor;
  final String title;

  void onClicked(){
    onTap.call();
  }
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClicked,
      style: TextButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: bgColor,
        textStyle: const TextStyle(
          fontSize: 28,
        ),
      ),
      child: Text(title),
    );
  }
}
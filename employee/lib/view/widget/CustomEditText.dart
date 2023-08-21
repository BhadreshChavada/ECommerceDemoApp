import 'package:flutter/material.dart';

class CustomEditText extends StatefulWidget {

  const CustomEditText({super.key, this.hint = "", required this.textController});

  final String hint;
  final TextEditingController textController ;


  @override
  State<CustomEditText> createState() => _CustomEditTextState(hint: hint,textController: textController);
}
class _CustomEditTextState extends State<CustomEditText> {

  _CustomEditTextState({this.hint = "",required this.textController});

  final TextEditingController textController ;

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: textController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: hint,
            ),
          ),
        ),
      ],
    );
  }
}

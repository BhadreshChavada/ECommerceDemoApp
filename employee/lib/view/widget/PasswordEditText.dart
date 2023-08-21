import 'package:flutter/material.dart';

class PasswordEditText extends StatefulWidget {

  const PasswordEditText({super.key, this.hint = "", required this.textController});

  final String hint;
  final TextEditingController textController ;


  @override
  State<PasswordEditText> createState() => _PasswordEditTextState(hint: hint,textController: textController);
}
class _PasswordEditTextState extends State<PasswordEditText> {

  _PasswordEditTextState({this.hint = "",required this.textController});

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
            obscureText: true,
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

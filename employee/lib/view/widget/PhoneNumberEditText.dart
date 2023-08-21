import 'package:flutter/material.dart';

class PhoneNumberEditText extends StatefulWidget {

  const PhoneNumberEditText({super.key, this.hint = "", required this.textController});

  final String hint;
  final TextEditingController textController ;


  @override
  State<PhoneNumberEditText> createState() => _PhoneNumberEditTextState(hint: hint,textController: textController);
}
class _PhoneNumberEditTextState extends State<PhoneNumberEditText> {

  _PhoneNumberEditTextState({this.hint = "",required this.textController});

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
            maxLength: 10,
              keyboardType: TextInputType.phone,
          ),
        ),
      ],
    );
  }
}

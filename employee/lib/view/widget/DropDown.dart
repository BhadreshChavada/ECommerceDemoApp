import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  final String hint;
  final List<String> items;
  final void Function(String?) onChanged;

  const DropDown({super.key, this.hint = "",required this.items, required this.onChanged});

  @override
  State<StatefulWidget> createState() => _DropDownState(hint: hint,items: items,onChanged: onChanged);
}

class _DropDownState extends State<DropDown> {

  _DropDownState({this.hint = "",required this.items,required this.onChanged});
  var hint;
  final List<String> items;
  String dropdownvalue = '';
  void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: DropdownButtonFormField(
            isExpanded: true,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: hint),
            icon: const Icon(Icons.keyboard_arrow_down),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}


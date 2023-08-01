import 'package:flutter/material.dart';

class textfield extends StatelessWidget {
  textfield({this.hinttext, this.onchanged, this.text = false});
  Function(String?)? onchanged;
  String? hinttext;
  bool? text;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: text!,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Field is required';
          }
        },
        onChanged: onchanged,
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: TextStyle(color: Colors.white),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue))));
  }
}

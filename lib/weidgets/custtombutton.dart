import 'package:flutter/material.dart';

class custombutton extends StatelessWidget {
  custombutton({required this.text, this.ontap});
  String? text;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(text!),
        ),
      ),
    );
  }
}

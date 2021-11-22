import 'package:flutter/material.dart';

class TextFormCustom extends StatelessWidget {
  final Widget? icon;
  final String? label;
  final void Function(String)? onChanged;

  TextFormCustom({this.label, this.icon, this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * .9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xffF1F3F5),
      ),
      child: TextFormField(
        onChanged: onChanged,
        style: TextStyle(
          color: Colors.black,
          decoration: TextDecoration.none,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: icon,
          hintText: label,
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

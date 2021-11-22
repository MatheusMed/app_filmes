import 'package:flutter/material.dart';

class ButtonTypeSelect extends StatelessWidget {
  final String typeText;
  final void Function()? onPressed;
  final Color? backgroundColor;

  ButtonTypeSelect({
    required this.typeText,
    required this.onPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        typeText,
        style: TextStyle(
          color: backgroundColor == Colors.white ? Colors.black : Colors.white,
          fontSize: 16,
        ),
      ),
      style: TextButton.styleFrom(
        backgroundColor:
            backgroundColor == null ? Color(0xff00384C) : backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        side: BorderSide(color: Colors.grey.shade200),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  AccountButton({Key? key, required this.text, required this.color, required this.textColor}) : super(key: key);
  final String text;
  final Color color;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: color == Colors.white ? Border.all(color: Colors.grey.withOpacity(0.3)) : Border(),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}

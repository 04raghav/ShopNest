import 'package:shopnest/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  const CustomButton(
      {super.key, required this.text, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor:
              color == null ? GlobalVariables.secondaryColor : color,
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Text(
          text,
          style: TextStyle(color: color == null ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

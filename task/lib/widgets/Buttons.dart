import 'package:flutter/material.dart';

class HomeScreenButton1 extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final bool loading ;

  const HomeScreenButton1({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.green,
    this.width = double.infinity,
    this.textColor = Colors.black,
    this.loading = false,
    this.height = 50.0, // Default height of the button
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width - 20;
    double buttonWidth = width == double.infinity ? screenWidth : width;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(buttonWidth, height),

      ),
      child: Center(child: loading ? const CircularProgressIndicator(strokeWidth: 3, color: Colors.white,) : Text(text, style: TextStyle(fontSize: 16, color: textColor),)),
    );
  }
}


class HomeScreenButton2 extends StatelessWidget {
  final String text;
  final Color color;
  final Color borderColor;
  final double borderWidth;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const HomeScreenButton2({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.white,
    this.borderColor = Colors.black,
    this.borderWidth = 2.0,
    this.width = double.infinity,
    this.height = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width - 20;
    double buttonWidth = width == double.infinity ? screenWidth : width;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(buttonWidth, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}


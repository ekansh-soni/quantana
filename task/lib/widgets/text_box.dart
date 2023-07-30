import 'package:flutter/material.dart';

class TextBoxLoginScreen1 extends StatefulWidget {
  final String text;
  final double width;
  final TextEditingController controller;
  final Icon? icon;
  final OT;
  final validator;
   const TextBoxLoginScreen1({
    Key? key, // Add the 'Key?' type for the key parameter
    required this.text,
    required this.controller,
    this.width = double.infinity,
     this.OT = false,
    this.icon ,
    required this.validator ,

  }) : super(key: key);

  @override
  State<TextBoxLoginScreen1> createState() => _TextBoxLoginScreen1State();
}

class _TextBoxLoginScreen1State extends State<TextBoxLoginScreen1> {
  late TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: widget.OT,
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.text,
          border: const OutlineInputBorder(),
          prefixIcon: widget.icon,
        ),
        validator: widget.validator,

      ),
    );
  }
}


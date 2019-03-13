import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final IconData icon;
  final bool obscureText;

  const InputField({
    this.icon,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      child: TextFormField(
        obscureText: obscureText ?? false,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(icon,
            color: Colors.white,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
          ),
        ),
      ),
    );
  }
}

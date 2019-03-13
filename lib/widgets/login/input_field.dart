import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final IconData icon;

  const InputField({
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      child: TextFormField(
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

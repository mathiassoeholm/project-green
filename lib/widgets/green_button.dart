import 'package:flutter/material.dart';
import 'package:project_green/widgets/theme_values.dart';

class GreenButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const GreenButton({
    this.onTap,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(18, 14, 18, 14),
        decoration: BoxDecoration(
          color: ThemeValues.green,
          borderRadius: BorderRadius.circular(100),
          boxShadow: ThemeValues.buttonDropShadow,
        ),
        child: Text(text,
          style: Theme.of(context).textTheme.title.merge(TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          )),
        ),
      ),
    );
  }
}

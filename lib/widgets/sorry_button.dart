import 'package:flutter/material.dart';
import 'package:project_green/widgets/theme_values.dart';

class SorryButton extends StatelessWidget {
  final VoidCallback onTap;

  const SorryButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: ThemeValues.green,
          borderRadius: BorderRadius.circular(100),
          boxShadow: ThemeValues.buttonDropShadow,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("SORRY",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: Icon(Icons.public,
                  color: Colors.white,
                  size: 22,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LogoHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Icon(Icons.filter_vintage,
            size: 70,
            color: Colors.white,
          ),
        ),
        Text('Project\nGreen',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 44,
            fontWeight: FontWeight.w600,
            height: 0.67,
            letterSpacing: -1,
          ),
        ),
      ],
    );
  }
}

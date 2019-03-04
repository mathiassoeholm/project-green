import 'package:flutter/material.dart';
import 'package:project_green/widgets/login/login_background.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: LoginBackground(
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text('Project\nGreen',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 44,
                    fontWeight: FontWeight.w600,
                    height: 0.67,
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}

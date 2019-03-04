import 'package:flutter/material.dart';
import 'package:project_green/widgets/theme_values.dart';
import 'package:project_green/widgets/widget_lib/conditional.dart';

class LoginBackground extends StatelessWidget {
  final Widget child;

  const LoginBackground({
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: ThemeValues.green,
        ),
        Positioned(
          left: -50, right: -400, top: -300, bottom: -10,
          child: Opacity(
            opacity: 0.2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/login_background.jpg'),
                )
              ),
            ),
          ),
        ),
        Positioned(
          left: 0, right: 0, top: 0, height: 200,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ThemeValues.green,
                  ThemeValues.green.withAlpha(0),
                ],
              ),
            ),
          ),
        ),
        Conditional(
          predicate: () => child != null,
          child: child,
        )
      ]
    );
  }
}

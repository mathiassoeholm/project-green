import 'package:flutter/material.dart';
import 'package:project_green/widgets/theme_values.dart';
import 'package:project_green/widgets/widget_lib/conditional.dart';

class LoginBackground extends StatefulWidget {
  final Widget child;

  const LoginBackground({
    this.child,
  });

  @override
  _LoginBackgroundState createState() => _LoginBackgroundState();
}

class _LoginBackgroundState extends State<LoginBackground> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation backgroundAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 30),
    );

    animationController.repeat(reverse: true);

    backgroundAnimation = CurvedAnimation(parent: animationController, curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: ThemeValues.green,
        ),
        AnimatedBuilder(
          animation: backgroundAnimation,
          builder: (context, child) {
            final offset = backgroundAnimation.value*300;

            return Positioned(
              left: -50, right: -400, top: -300+offset, bottom: -offset,
              child: child,
            );
          },
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
          predicate: () => widget.child != null,
          child: widget.child,
        )
      ]
    );
  }
}

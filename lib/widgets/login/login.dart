import 'package:flutter/material.dart';
import 'package:project_green/widgets/login/email_login.dart';
import 'package:project_green/widgets/login/login_background.dart';
import 'package:project_green/widgets/login/login_overview.dart';
import 'package:project_green/widgets/login/logo_header.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController nextPageController;
  Animation slideAnimation;

  @override
  void initState() {
    super.initState();

    nextPageController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    slideAnimation = CurvedAnimation(
      parent: nextPageController,
      curve: Curves.fastLinearToSlowEaseIn,
      reverseCurve: Curves.fastLinearToSlowEaseIn.flipped,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (nextPageController.value > 0) {
          nextPageController.reverse();
          return false;
        } else {
          return true;
        }
      },
      child: LoginBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Stack(
                      fit: StackFit.passthrough,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(4.0, 13, 0, 0),
                            child: AnimatedBuilder(
                              animation: slideAnimation,
                              builder: (context, child) {
                                return Opacity(
                                  opacity: slideAnimation.value,
                                  child: child,
                                );
                              },
                              child: IconButton(
                              iconSize: 34,
                                icon: Icon(Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  nextPageController.reverse();
                                },
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            LogoHeader(),
                            _buildBottomStack(context, constraints),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ),
        ),
      ),
    );
  }

  Widget _buildBottomStack(BuildContext context, BoxConstraints viewportConstraints) {
    return Stack(
      children: <Widget>[
        AnimatedBuilder(
          animation: nextPageController,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.translationValues(
                -viewportConstraints.maxWidth*slideAnimation.value,
                0,
                0,
              ),
              child: child,
            );
          },
          child: Center(
            child: LoginOverview(
              onTapLogin: () {
                nextPageController.forward();
              },
            )
          ),
        ),
        AnimatedBuilder(
          animation: nextPageController,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.translationValues(
                viewportConstraints.maxWidth*(1.0-slideAnimation.value),
                0,
                0
              ),
              child: child,
            );
          },
          child: Center(
            child: EmailLogin(),
          ),
        ),
      ],
    );

  }

  @override
  void dispose() {
    nextPageController.dispose();
    super.dispose();
  }
}

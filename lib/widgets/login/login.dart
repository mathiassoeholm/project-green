import 'package:flutter/material.dart';
import 'package:project_green/widgets/login/email_login.dart';
import 'package:project_green/widgets/login/login_background.dart';
import 'package:project_green/widgets/login/login_overview.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Column(
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
                ),
              ),
              Expanded(
                // SingleChildScrollView avoids overflow when keyboard moves up
                child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Stack(
                        children: <Widget>[
                          Transform(
                            transform: Matrix4.translationValues(-constraints.maxWidth, 0, 0),
                            child: Center(
                              child: LoginOverview()
                            ),
                          ),
                          Transform(
                            transform: Matrix4.translationValues(0, 0, 0),
                            child: Center(
                              child: LoginOverview()
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}

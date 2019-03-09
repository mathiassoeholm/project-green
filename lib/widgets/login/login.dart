import 'package:flutter/material.dart';
import 'package:project_green/localization/app_localizations.dart';
import 'package:project_green/widgets/login/login_background.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_green/widgets/login/wide_button.dart';
import 'package:project_green/widgets/theme_values.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: LoginBackground(
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Column(
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
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: WideButton(
                        text: AppLocalizations.of(context).facebookLoginButton,
                        textColor: Colors.white,
                        backgroundColor: ThemeValues.facebookBlue,
                        icon: Icon(FontAwesomeIcons.facebookF,
                          color: Colors.white,
                          size: 22,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/home');
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: WideButton(
                        text: AppLocalizations.of(context).loginButton,
                        textColor: Colors.white,
                        backgroundColor: Colors.transparent,
                        borderColor: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: WideButton(
                        text: AppLocalizations.of(context).signUpButton,
                        textColor: Colors.white,
                        backgroundColor: Colors.transparent,
                        borderColor: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_green/localization/app_localizations.dart';
import 'package:project_green/widgets/login/wide_button.dart';
import 'package:project_green/widgets/theme_values.dart';

class LoginOverview extends StatelessWidget {
  final VoidCallback onTapLogin;

  const LoginOverview({
    this.onTapLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 24, 8.0, 8.0),
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
            onTap: onTapLogin,
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
    );
  }
}

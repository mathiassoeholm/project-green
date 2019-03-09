import 'package:flutter/material.dart';
import 'package:project_green/localization/app_localizations.dart';
import 'package:project_green/widgets/login/wide_button.dart';
import 'package:project_green/widgets/theme_values.dart';

class EmailLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: WideButton(
            text: AppLocalizations.of(context).loginButton,
            textColor: ThemeValues.green,
            backgroundColor: Colors.white,
            onTap: () { },
          ),
        ),
      ],
    );
  }
}

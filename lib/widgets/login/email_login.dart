import 'package:flutter/material.dart';
import 'package:project_green/localization/app_localizations.dart';
import 'package:project_green/widgets/login/wide_button.dart';
import 'package:project_green/widgets/theme_values.dart';

class EmailLogin extends StatefulWidget {
  @override
  _EmailLoginState createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
          ),
          TextFormField(
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: WideButton(
              text: AppLocalizations.of(context).loginButton,
              textColor: ThemeValues.green,
              backgroundColor: Colors.white,
              onTap: () { },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(AppLocalizations.of(context).forgotPassword,
              style: Theme.of(context).textTheme.subtitle.merge(TextStyle(
                color: Colors.white
              )),
            ),
          )
        ],
      ),
    );
  }
}

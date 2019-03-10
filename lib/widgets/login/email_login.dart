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
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 290,
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail_outline)
              ),
            ),
          ),
          Container(
            width: 290,
            child: TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline)
                ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: WideButton(
              text: AppLocalizations.of(context).loginButton,
              textColor: ThemeValues.green,
              backgroundColor: Colors.white,
              onTap: () { },
            ),
          ),
          Text(AppLocalizations.of(context).forgotPassword,
            style: Theme.of(context).textTheme.subtitle.merge(TextStyle(
              color: Colors.white
            )),
          )
        ],
      ),
    );
  }
}

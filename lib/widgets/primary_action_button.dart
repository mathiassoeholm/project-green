import 'package:flutter/material.dart';
import 'package:project_green/localization/app_localizations.dart';
import 'package:project_green/widgets/theme_values.dart';

class PrimaryActionButton extends StatelessWidget {
  static const height = 60.0;

  final String text;
  final String emoji;
  final VoidCallback onTap;

  const PrimaryActionButton({
    Key key,
    @required this.text,
    @required this.emoji,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height,
        decoration: BoxDecoration(
          boxShadow: ThemeValues.boxShadow,
          borderRadius: BorderRadius.circular(height/2.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(height/2.0),
          child: Material(
            color: Colors.black,
            child: InkWell(
              onTap: onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 2, 0),
                    child: Text(text),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(2, 0, 8, 0),
                      child: Text(emoji,
                        style: TextStyle(
                            fontSize: 24
                        ),
                      )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

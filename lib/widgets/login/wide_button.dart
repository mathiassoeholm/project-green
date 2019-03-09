import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:project_green/widgets/widget_lib/conditional.dart';

class WideButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final Icon icon;
  final VoidCallback onTap;

  const WideButton({
    @required this.text,
    @required this.textColor,
    @required this.backgroundColor,
    this.borderColor,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final normalSplashColor = Theme.of(context).splashColor;

    final splashColor = backgroundColor == Colors.transparent
      ? normalSplashColor.withAlpha(0xAA)
      : normalSplashColor;

    return Container(
      height: 52,
      width: 290,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: splashColor,
            onTap: onTap,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Conditional(
                    predicate: () => icon != null,
                    child: icon,
                  ),
                  Conditional(
                    predicate: () => icon != null,
                    child: Container(
                      width: 5,
                    ),
                  ),
                  AutoSizeText(text,
                    style: Theme.of(context).textTheme.title.merge(TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
        border: borderColor == null
          ? null
          : Border.all(
            color: borderColor,
            width: 1.4,
          )
      ),
    );
  }
}

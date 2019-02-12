import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_green/challenges/challenge.dart';
import 'package:project_green/localization/app_localizations.dart';
import 'package:project_green/widgets/green_button.dart';
import 'package:project_green/widgets/theme_values.dart';

class ThatsOkayModal extends StatefulWidget {
  final Animation<double> openAnimation;
  final Challenge challenge;

  const ThatsOkayModal({
    @required this.challenge,
    @required this.openAnimation,
  });

  @override
  ThatsOkayModalState createState() {
    return new ThatsOkayModalState();
  }
}

class ThatsOkayModalState extends State<ThatsOkayModal> {

  Animation<double> _scaleAnimation;
  Animation<double> _blurAnimation;

  @override
  void initState() {
    super.initState();

    widget.openAnimation.addListener(() {
      setState(() {});
    });

    _blurAnimation = CurvedAnimation(parent: widget.openAnimation, curve: Curves.fastOutSlowIn);
    _scaleAnimation = CurvedAnimation(parent: widget.openAnimation, curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 4.0 * _blurAnimation.value,
              sigmaY: 4.0 * _blurAnimation.value,
            ),
            child: Container(
              decoration: new BoxDecoration(color: Color(0xFF585757).withOpacity(0.36 * _blurAnimation.value)),
            ),
          ),
        ),
        Center(
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                  boxShadow: ThemeValues.modalDropShadow,
                ),
                width: 346,
                height: 249,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(AppLocalizations.of(context).thatsOkay,
                        style: Theme.of(context).textTheme.display1,
                      ),
                      Text('${AppLocalizations.of(context).getEncouragement(widget.challenge.type)}'
                        '\n${AppLocalizations.of(context).youAreAwesome}',
                        style: Theme.of(context).textTheme.title.merge(TextStyle(
                          height: 1.65,
                        )),
                        textAlign: TextAlign.center,
                      ),
                      GreenButton(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        text: AppLocalizations.of(context).imAwesome,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ]
    );
  }
}

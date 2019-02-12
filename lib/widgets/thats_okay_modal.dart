import 'dart:ui';

import 'package:flutter/material.dart';

/// UP NEXT: ----------------------------------------------------------------------
// Prettify onTapSorry method

class ThatsOkayModal extends StatefulWidget {
  final Animation<double> openAnimation;

  const ThatsOkayModal({
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
                ),
                width: 346,
                height: 249,
              ),
            ),
          ),
        ),
      ]
    );
  }
}

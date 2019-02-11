import 'dart:ui';

import 'package:flutter/material.dart';

/// UP NEXT: ----------------------------------------------------------------------
// Hook up back button
// Prettify animations (useful: https://stackoverflow.com/questions/52408610/flutter-custom-animated-dialog)
// Prettify onTapSorry method

class ThatsOkayModal extends StatefulWidget {
  final Animation<double> openAnimation;
  final Animation<double> closeAnimation;

  const ThatsOkayModal({
    @required this.openAnimation,
    @required this.closeAnimation,
  });

  @override
  ThatsOkayModalState createState() {
    return new ThatsOkayModalState();
  }
}

class ThatsOkayModalState extends State<ThatsOkayModal> {
  @override
  void initState() {
    super.initState();

    widget.openAnimation.addListener(() {
      setState(() {});
    });

    widget.closeAnimation.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 4.0 * widget.openAnimation.value,
        sigmaY: 4.0 * widget.openAnimation.value,
      ),
      child: new Container(
        decoration: new BoxDecoration(color: Color(0xFF585757).withOpacity(0.36 * widget.openAnimation.value)),
        child: Center(
          child: Container(
            width: 346,
            height: 249,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

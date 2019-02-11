import 'dart:ui';

import 'package:flutter/material.dart';

/// UP NEXT: ----------------------------------------------------------------------
// Check if disposed is called
// Hook up back button
// Prettify animations (useful: https://stackoverflow.com/questions/52408610/flutter-custom-animated-dialog)
// Prettify onTapSorry method

class ThatsOkayModal extends StatefulWidget {
  final VoidCallback hideModal;

  const ThatsOkayModal({this.hideModal});

  @override
  ThatsOkayModalState createState() {
    return new ThatsOkayModalState();
  }
}

class ThatsOkayModalState extends State<ThatsOkayModal> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<double> _opacityAnimation;
  Animation<double> _blurAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 0.36).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn)
    );

    _blurAnimation = Tween<double>(begin: 0.0, end: 4.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn)
    );

    _controller.addListener(() {
      setState(() {
        // Rebuild
      });
    });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: _blurAnimation.value,
        sigmaY: _blurAnimation.value,
      ),
      child: GestureDetector(
        onTap: widget.hideModal,
        child: new Container(
          decoration: new BoxDecoration(color: Color(0xFF585757).withOpacity(_opacityAnimation.value * 0.36)),
          child: Center(
            child: Container(
              width: 346,
              height: 249,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

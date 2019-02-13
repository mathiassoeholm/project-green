import 'dart:ui';

import 'package:flutter/material.dart';

class ChallengeCarousel extends StatefulWidget {
  @override
  _ChallengeCarouselState createState() => _ChallengeCarouselState();
}

class _ChallengeCarouselState extends State<ChallengeCarousel> {
  PageController controller;

  // Start with a bug number such the it allows scrolling left
  int currentPage = 1000;

  @override
  void initState() {
    super.initState();

    controller = PageController(
      initialPage: currentPage,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (value) {
        setState(() {
          currentPage = value;
        });
      },
      controller: controller,
      itemBuilder: buildItem,
    );
  }

  Widget buildItem(BuildContext context, int index) {
    return AnimatedBuilder(
      animation: controller,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              color: Colors.red,
            ),
          ),
        ),
      ),
      builder: (context, child) {
        var value = 1.0;
        if (controller.position.haveDimensions) {
          value = controller.page - index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        }

        final easedValue = Curves.easeInOut.transform(value);
        final scale = lerpDouble(0.8, 1.0, easedValue);

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.diagonal3Values(scale, scale, scale),
          child: child
        );
      },
    );
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }
}

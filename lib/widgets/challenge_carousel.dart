import 'package:flutter/material.dart';

class ChallengeCarousel extends StatefulWidget {
  @override
  _ChallengeCarouselState createState() => _ChallengeCarouselState();
}

class _ChallengeCarouselState extends State<ChallengeCarousel> {
  PageController controller;
  int currentpage = 0;

  @override
  void initState() {
    super.initState();

    controller = PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (value) {
        setState(() {
          currentpage = value;
        });
      },
      controller: controller,
      itemBuilder: buildItem,
    );
  }

  Widget buildItem(BuildContext context, int index) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        var value = 1.0;
        if (controller.position.haveDimensions) {
          value = controller.page - index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        }

        return Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
            child: child,
          ),
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

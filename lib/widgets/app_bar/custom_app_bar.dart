import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_green/widgets/app_bar/app_bar_content.dart';
import 'package:project_green/widgets/home/home_values.dart';

class CustomAppBar extends StatelessWidget {
  final ScrollController scrollController;
  final Stream<double> collapseFactorStream;

  const CustomAppBar({
    @required this.scrollController,
    @required this.collapseFactorStream,
  });

  double get scrollOffset => scrollController.hasClients
      ? scrollController.offset
      : 0;

  @override
  Widget build(BuildContext context) {
    final safeAreaTop = MediaQuery.of(context).padding.top;

    return AnimatedBuilder(
      animation: scrollController,
      builder: (context, child) {
        return Positioned(
          left: 0, right: 0, top: 0, height: max(appBarMinHeight + safeAreaTop, appBarMaxHeight - scrollOffset) + pageBorderRadius,
          child: child,
        );
      },
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/cover_image.png'),
                fit: BoxFit.cover
            )
        ),
        child: AppBarContent(
          collapseFactorStream: collapseFactorStream,
        ),
      ),
    );
  }
}

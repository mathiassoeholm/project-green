import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_green/widgets/home/home_values.dart';
import 'package:project_green/widgets/theme_values.dart';

class ListBackground extends StatelessWidget {
  final ScrollController scrollController;

  const ListBackground({
    @required this.scrollController
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
          left: 0, right: 0, top: max(appBarMinHeight + safeAreaTop, appBarMaxHeight + safeAreaTop - scrollOffset), bottom: 0,
          child: child,
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          color: ThemeValues.lightBackground,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(pageBorderRadius),
              topLeft: Radius.circular(pageBorderRadius)
          ),
          boxShadow: ThemeValues.listDropShadow,
        ),
      ),
    );
  }
}

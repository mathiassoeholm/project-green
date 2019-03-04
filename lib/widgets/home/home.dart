import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_green/widgets/app_bar/custom_app_bar.dart';
import 'package:project_green/widgets/create_challenge.dart';
import 'package:project_green/widgets/custom_tab_bar.dart';
import 'package:project_green/widgets/home/challenge_list.dart';
import 'package:project_green/widgets/home/home_values.dart';
import 'package:project_green/widgets/home/list_background.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return new _HomeState();
  }
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();

  AnimationController createTransitionController;
  Animation<double> createTransitionAnimation;
  final appBarCollapseFactorController = StreamController<double>.broadcast();

  @override
  void initState() {
    super.initState();

    createTransitionController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    createTransitionAnimation = CurvedAnimation(
      parent: createTransitionController,
      curve: Curves.fastOutSlowIn
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    scrollController.addListener(() {
      final collapseFactor = (scrollController.offset/(appBarMaxHeight-appBarMinHeight)).clamp(0.0, 1.0);
      appBarCollapseFactorController.add(collapseFactor);
    });
  }

  @override
  void dispose() {
    appBarCollapseFactorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final safeAreaTop = MediaQuery.of(context).padding.top;
    final safeAreaBottom = MediaQuery.of(context).padding.bottom;

    return WillPopScope(
      onWillPop: () async {
        if (createTransitionController.value > 0) {
          createTransitionController.reverse();
          return false;
        } else {
          return true;
        }
      },
      child: Material(
        child: Stack(
          children: <Widget>[
            CustomAppBar(
              collapseFactorStream: appBarCollapseFactorController.stream.asBroadcastStream(),
              scrollController: scrollController,
            ),
            ListBackground(
              scrollController: scrollController,
            ),
            Positioned(
              left: 0, right: 0, top: appBarMinHeight + safeAreaTop, bottom: 0,
              child: ChallengeList(
                controller: scrollController,
                invisibleHeaderMaxSize: appBarMaxHeight - appBarMinHeight,
              )
            ),
            AnimatedBuilder(
              animation: createTransitionAnimation,
              builder: (context, child) {
                return Positioned.fill(
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      return Transform(
                        transform: Matrix4.translationValues(
                          0,
                          (1-createTransitionAnimation.value)*constraints.maxHeight,
                          0,
                        ),
                        child: child,
                      );
                    },
                  )
                );
              },
              child: CreateChallenge(
                close: createTransitionController.reverse,
              ),
            ),
            AnimatedBuilder(
              animation: createTransitionAnimation,
              builder: (context, child) {
                return Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Transform(
                      transform: Matrix4.translationValues(
                        0,
                        (CustomTabBar.totalHeight + safeAreaBottom)*createTransitionAnimation.value,
                        0,
                      ),
                      child: child,
                    ),
                  ),
                );
              },
              child: CustomTabBar(
                openCreateChallenge: () {
                  createTransitionController.forward();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

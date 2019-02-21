import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:project_green/challenges/challenge.dart';
import 'package:project_green/widgets/home/challenge_card.dart';
import 'package:project_green/widgets/custom_tab_bar.dart';
import 'package:project_green/widgets/app_bar/invisible_persistent_header_delegate.dart';
import 'package:project_green/widgets/home/home_values.dart';
import 'package:project_green/widgets/home/thats_okay_modal.dart';

class ChallengeList extends StatelessWidget {
  final BuiltList<Challenge> challenges;
  final DateTime today;
  final ScrollController controller;
  final double invisibleHeaderMaxSize;

  const ChallengeList({
    @required this.challenges,
    @required this.today,
    @required this.controller,
    @required this.invisibleHeaderMaxSize,
  });

  @override
  Widget build(BuildContext context) {
    final safeAreaBottom = MediaQuery.of(context).padding.bottom;

    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomScrollView(
          physics: BouncingScrollPhysics(),
          controller: controller,
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              /// We use the invisible persistent header to push the list below our custom app bar.
              /// This also enables the list to move upwards until it is appBarMinHeight away from the top.
              delegate: InvisiblePersistentHeaderDelegate(
                minSize: 0,
                maxSize: invisibleHeaderMaxSize,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                _createSliverListDelegate(),
                childCount: challenges.length,
              ),
            ),
            SliverToBoxAdapter(
              child: () {
                final listHeight = (cardHeight+cardPadding)*challenges.length + CustomTabBar.totalHeight + safeAreaBottom;
                final remainingSpace = max(0.0, constraints.maxHeight-listHeight);

                return Container(
                  height: remainingSpace,
                  color: Colors.red,
                );
              }()
            ),
            /// Bottom list padding
            SliverToBoxAdapter(
              child: Container(
                height: CustomTabBar.totalHeight + safeAreaBottom,
              ),
            ),
          ],
        );
      },
    );
  }

  IndexedWidgetBuilder _createSliverListDelegate() {
    return (context, index) {
      return Padding(
        padding: EdgeInsets.fromLTRB(cardPadding, cardPadding, cardPadding, 0),
        child: ChallengeCard(challenges[index],
          today: today,
          onTapSorry: () {
            showGeneralDialog(
              barrierDismissible: false,
              transitionDuration: Duration(milliseconds: 450),
              // Transition is handled in modal itself, so simply return child
              transitionBuilder: (_, __, ___, child) => child,
              context: context,
              pageBuilder: (context, animation, secondaryAnimation) {
                return ThatsOkayModal(
                  challenge: challenges[index],
                  openAnimation: animation,
                );
              },
            );
          },
        ),
      );
    };
  }
}

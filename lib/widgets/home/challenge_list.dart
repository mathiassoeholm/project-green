import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:project_green/appstate/app_state.dart';
import 'package:project_green/challenges/challenge.dart';
import 'package:project_green/challenges/challenges_actions.dart';
import 'package:project_green/widgets/app_bar/invisible_persistent_header_delegate.dart';
import 'package:project_green/widgets/challenge_card/challenge_card.dart';
import 'package:project_green/widgets/custom_tab_bar.dart';
import 'package:project_green/widgets/home/home_values.dart';
import 'package:project_green/widgets/home/thats_okay_modal.dart';
import 'package:redux/redux.dart';

class ChallengeList extends StatefulWidget {
  final ScrollController controller;
  final double invisibleHeaderMaxSize;

  const ChallengeList({
    @required this.controller,
    @required this.invisibleHeaderMaxSize,
  });

  @override
  ChallengeListState createState() {
    return new ChallengeListState();
  }
}

class ChallengeListState extends State<ChallengeList> {
  bool isInDeleteMode = false;

  @override
  Widget build(BuildContext context) {
    final safeAreaBottom = MediaQuery.of(context).padding.bottom;

    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return CustomScrollView(
              physics: BouncingScrollPhysics(),
              controller: widget.controller,
              slivers: <Widget>[
                SliverPersistentHeader(
                  pinned: true,
                  /// We use the invisible persistent header to push the list below our custom app bar.
                  /// This also enables the list to move upwards until it is appBarMinHeight away from the top.
                  delegate: InvisiblePersistentHeaderDelegate(
                    minSize: 0,
                    maxSize: widget.invisibleHeaderMaxSize,
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    _createSliverListDelegate(vm),
                    childCount: vm.challenges.length,
                  ),
                ),
                SliverToBoxAdapter(
                    child: () {
                      final listHeight = (cardHeight+cardPadding)*vm.challenges.length + CustomTabBar.totalHeight + safeAreaBottom;
                      final remainingSpace = max(0.0, constraints.maxHeight-listHeight);

                      return Container(
                        height: remainingSpace,
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
      },
    );
  }

  IndexedWidgetBuilder _createSliverListDelegate(_ViewModel vm) {
    return (context, index) {
      return Stack(
        children: <Widget>[
          ChallengeCard(vm.challenges[index],
            isInDeleteMode: isInDeleteMode,
            today: vm.today,
            onLongPress: () {
              setState(() {
                isInDeleteMode = true;
              });
            },
            onDeleted: () {
              vm.removeChallenge(vm.challenges[index]);
            },
            onTapSorry: () {
              showGeneralDialog(
                barrierDismissible: false,
                transitionDuration: Duration(milliseconds: 450),
                // Transition is handled in modal itself, so simply return child
                transitionBuilder: (_, __, ___, child) => child,
                context: context,
                pageBuilder: (context, animation, secondaryAnimation) {
                  return ThatsOkayModal(
                    challenge: vm.challenges[index],
                    openAnimation: animation,
                  );
                },
              );
            },
          ),
        ],
      );
    };
  }
}

class _ViewModel {
  final BuiltList<Challenge> challenges;
  final DateTime today;
  final Function(Challenge) removeChallenge;

  _ViewModel({
    @required this.challenges,
    @required this.today,
    @required this.removeChallenge,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      challenges: store.state.challenges,
      today: store.state.time.today,
      removeChallenge: (challenge) {
        store.dispatch(RemoveChallengeAction(challenge));
      }
    );
  }
}
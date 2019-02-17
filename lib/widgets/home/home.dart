import 'dart:async';
import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:project_green/appstate/app_state.dart';
import 'package:project_green/challenges/challenge.dart';
import 'package:project_green/widgets/app_bar/app_bar_content.dart';
import 'package:project_green/widgets/app_bar/custom_app_bar.dart';
import 'package:project_green/widgets/home/challenge_list.dart';
import 'package:project_green/widgets/create_challenge.dart';
import 'package:project_green/widgets/custom_tab_bar.dart';
import 'package:project_green/widgets/home/home_values.dart';
import 'package:project_green/widgets/home/list_background.dart';
import 'package:project_green/widgets/theme_values.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  AnimationController _createTransitionController;
  Animation<double> _createTransitionAnimation;
  final _appBarCollapseFactorController = StreamController<double>.broadcast();

  @override
  void initState() {
    super.initState();

    _createTransitionController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this
    );

    _createTransitionAnimation = CurvedAnimation(
      parent: _createTransitionController,
      curve: Curves.fastOutSlowIn
    )..addListener(() {
      setState(() {
        // Rebuild
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final safeAreaTop = MediaQuery.of(context).padding.top;

    _scrollController.addListener(() {
      final collapseFactor = (_scrollController.offset/(appBarMaxHeight-appBarMinHeight-safeAreaTop)).clamp(0.0, 1.0);
      _appBarCollapseFactorController.add(collapseFactor);
    });
  }

  @override
  void dispose() {
    _appBarCollapseFactorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final safeAreaTop = MediaQuery.of(context).padding.top;
    final safeAreaBottom = MediaQuery.of(context).padding.bottom;

    return WillPopScope(
      onWillPop: () async {
        if (_createTransitionController.value > 0) {
          _createTransitionController.reverse();
          return false;
        } else {
          return true;
        }
      },
      child: StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (BuildContext context, _ViewModel vm) {
          return Material(
            child: Stack(
              children: <Widget>[
                CustomAppBar(
                  collapseFactorStream: _appBarCollapseFactorController.stream.asBroadcastStream(),
                  scrollController: _scrollController,
                ),
                ListBackground(
                  scrollController: _scrollController,
                ),
                Positioned(
                  left: 0, right: 0, top: appBarMinHeight + safeAreaTop, bottom: 0,
                  child: ChallengeList(
                    challenges: vm.challenges,
                    today: vm.today,
                    padding: pageBorderRadius,
                    controller: _scrollController,
                    invisibleHeaderMaxSize: appBarMaxHeight - appBarMinHeight - safeAreaTop,
                  )
                ),
                Positioned.fill(
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      return Transform(
                        transform: Matrix4.translationValues(
                          0,
                          (1-_createTransitionAnimation.value)*constraints.maxHeight,
                          0,
                        ),
                        child: CreateChallenge(
                          close: _createTransitionController.reverse,
                        ),
                      );
                    },
                  )
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Transform(
                      transform: Matrix4.translationValues(
                        0,
                        (CustomTabBar.totalHeight + safeAreaBottom)*_createTransitionAnimation.value,
                        0,
                      ),
                      child: CustomTabBar(
                        openCreateChallenge: () {
                          _createTransitionController.forward();
                        },
                      ),
                    ),
                  )
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ViewModel {
  final BuiltList<Challenge> challenges;
  final DateTime today;

  _ViewModel({
    @required this.challenges,
    @required this.today,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        challenges: store.state.challenges,
      today: store.state.time.today,
    );
  }
}

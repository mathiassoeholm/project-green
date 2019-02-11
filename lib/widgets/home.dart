import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:project_green/appstate/app_state.dart';
import 'package:project_green/challenges/challenge.dart';
import 'package:project_green/widgets/InvisiblePersistentHeaderDelegate.dart';
import 'package:project_green/widgets/challenge_card.dart';
import 'package:project_green/widgets/custom_tab_bar.dart';
import 'package:project_green/widgets/theme_values.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  static const double appBarMaxHeight = 200.0;
  static const double appBarMinHeight = 50.0;
  static const double pageBorderRadius = 20.0;

  final ScrollController _controller = ScrollController();
  double _offset = 0;

  HomeState() {
    _controller.addListener(() {
      setState(() {
        _offset = _controller.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final safeAreaTop = MediaQuery.of(context).padding.top;

    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel vm) {
        return Material(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 0, right: 0, top: 0, height: max(appBarMinHeight + safeAreaTop, appBarMaxHeight - _offset) + pageBorderRadius,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/cover_image.png'),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0, right: 0, top: max(appBarMinHeight + safeAreaTop, appBarMaxHeight - _offset), bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ThemeValues.lightBackground,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(pageBorderRadius),
                            topLeft: Radius.circular(pageBorderRadius)
                          ),
                          boxShadow: ThemeValues.listDropShadow,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0, right: 0, top: appBarMinHeight + safeAreaTop, bottom: 0,
                      child: CustomScrollView(
                        physics: BouncingScrollPhysics(),
                        controller: _controller,
                        slivers: <Widget>[
                          SliverPersistentHeader(
                            pinned: true,
                            /// We use the invisible persistent header to push the list below our custom app bar.
                            /// This also enables the list to move upwards until it is appBarMinHeight away from the top.
                            delegate: InvisiblePersistentHeaderDelegate(
                              minSize: 0,
                              maxSize: appBarMaxHeight - appBarMinHeight - safeAreaTop,
                            ),
                          ),
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              _createSliverListDelegate(vm),
                              childCount: vm.challenges.length,
                            )
                          ),
                          /// Bottom list padding
                          SliverToBoxAdapter(
                            child: Container(
                              height: pageBorderRadius,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CustomTabBar(),
            ]
          ),
        );
      },
    );
  }

  IndexedWidgetBuilder _createSliverListDelegate(_ViewModel vm) {
    return (context, index) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(pageBorderRadius, pageBorderRadius, pageBorderRadius, 0),
          child: ChallengeCard(vm.challenges[index], vm.today),
      );
    };
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

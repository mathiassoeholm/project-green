import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:project_green/appstate/app_state.dart';
import 'package:project_green/challenges/challenge.dart';
import 'package:project_green/localization/app_localizations.dart';
import 'package:project_green/widgets/challenge_card.dart';
import 'package:project_green/widgets/new_challenge_button.dart';
import 'package:project_green/widgets/theme_values.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final safeAreaBottom = MediaQuery.of(context).padding.bottom;
    final newChallengeButtonPadding = max(safeAreaBottom, 10.0);

    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel vm) {
        return Material(
          color: Colors.white,
          child: Stack(
              children: <Widget>[
                CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      expandedHeight: 200.0,
                      title: Center(
                          child: Text(AppLocalizations.of(context).title,
                            style: Theme.of(context).textTheme.headline,
                          )
                      ),
                      backgroundColor: ThemeValues.green,
                      flexibleSpace: FlexibleSpaceBar(
                        background: DecoratedBox(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/cover_image_1.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        _createSliverListDelegate(vm),
                        childCount: vm.challenges.length,
                      )
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        height: NewChallengeButton.height + newChallengeButtonPadding,
                      ),
                    )
                  ],
                ),
                Positioned(
                    bottom: newChallengeButtonPadding, left: 0, right: 0,
                    child: NewChallengeButton()
                ),
              ],
            ),
        );
      },
    );
  }

  IndexedWidgetBuilder _createSliverListDelegate(_ViewModel vm) {
    return (context, index) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: ChallengeCard(vm.challenges[index]),
      );
    };
  }
}

class _ViewModel {
  final BuiltList<Challenge> challenges;

  _ViewModel({
    @required this.challenges,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        challenges: store.state.challenges,
    );
  }
}

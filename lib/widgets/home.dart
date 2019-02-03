import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:project_green/appstate/app_state.dart';
import 'package:project_green/challenges/challenge.dart';
import 'package:project_green/localization/app_localizations.dart';
import 'package:project_green/widgets/challenge_card.dart';
import 'package:project_green/widgets/theme_values.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel vm) {
        return Material(
          color: Colors.white,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                title: Center(
                    child: Text(AppLocalizations.of(context).title,
                      style: Theme.of(context).primaryTextTheme.title,
                    )
                ),
                backgroundColor: Color(0xFF40CD8D),
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: greenGradient,
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: ChallengeCard(vm.challenges[index]),
                    );
                  },
                  childCount: vm.challenges.length,
                )
              )
            ],
          ),
        );
      },
    );
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

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:project_green/appstate/app_state.dart';
import 'package:project_green/challenges/challenge.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel vm) {
        return CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 100.0,
              title: Text("my-challenges"),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(vm.challenges[index].emoji,
                        style: Theme.of(context).textTheme.title,
                      ),
                    ),
                  );
                },
                childCount: vm.challenges.length,
              )
            )
          ],
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

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:project_green/appstate/app_state.dart';
import 'package:project_green/appstate/app_state_reducer.dart';
import 'package:project_green/challenges/challenge.dart';
import 'package:project_green/localization/app_localizations.dart';
import 'package:project_green/widgets/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {

  final initialState = AppState((b) => b
    ..challenges = BuiltList<Challenge>([
      Challenge((b) => b
        ..emoji = "🐄"
      ),
      Challenge((b) => b
        ..emoji = "🛫"
      ),
      Challenge((b) => b
        ..emoji = "🐯"
      ),
      Challenge((b) => b
        ..emoji = "🐯"
      ),
      Challenge((b) => b
        ..emoji = "🐯"
      ),
      Challenge((b) => b
        ..emoji = "🐯"
      ),
      Challenge((b) => b
        ..emoji = "🐯"
      ),
      Challenge((b) => b
        ..emoji = "🐯"
      ),
      Challenge((b) => b
        ..emoji = "🐯"
      ),
      Challenge((b) => b
        ..emoji = "🐯"
      ),
      Challenge((b) => b
        ..emoji = "🐯"
      ),
      Challenge((b) => b
        ..emoji = "🐯"
      ),
      Challenge((b) => b
        ..emoji = "🐯"
      ),
      Challenge((b) => b
        ..emoji = "🐯"
      ),
      Challenge((b) => b
        ..emoji = "🐯"
      ),
      Challenge((b) => b
        ..emoji = "🐯"
      ),
      Challenge((b) => b
        ..emoji = "🐯"
      ),
      Challenge((b) => b
        ..emoji = "🐯"
      ),
      Challenge((b) => b
        ..emoji = "🐯"
      ),
    ]).toBuilder(),
  );

  final Store<AppState> store = Store<AppState>(
      appStateReducer,
      initialState: initialState,
  );

  runApp(StoreProvider(
    store: store,
    child: MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white
          ),
          subtitle: TextStyle(
            color: Colors.white,
          )
        )
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('da', 'DK'),
      ],
      home: Home(),
    ),
  ));
}
import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:project_green/appstate/app_state.dart';
import 'package:project_green/appstate/app_state_reducer.dart';
import 'package:project_green/challenges/challenge.dart';
import 'package:project_green/challenges/challenge_type.dart';
import 'package:project_green/localization/app_localizations.dart';
import 'package:project_green/time/time_updater.dart';
import 'package:project_green/widgets/create_challenge.dart';
import 'package:project_green/widgets/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {

  final random = Random();

  final initialState = AppState((b) => b
    ..user.displayName = 'afsdfa'
    ..user.photoURL = 'https://www.cobdoglaps.sa.edu.au/wp-content/uploads/2017/11/placeholder-profile-sq.jpg'
    ..challenges = BuiltList<Challenge>([
      Challenge((b) => b
        ..type = ChallengeType.beef
        ..start = DateTime(2018, random.nextInt(12) + 1, random.nextInt(28) + 1)
      ),
      Challenge((b) => b
        ..type = ChallengeType.flying
        ..start = DateTime(2019, random.nextInt(12) + 1, random.nextInt(28) + 1)
      ),
      Challenge((b) => b
        ..type = ChallengeType.beef
        ..start = DateTime(2018, random.nextInt(12) + 1, random.nextInt(28) + 1)
      ),
      Challenge((b) => b
        ..type = ChallengeType.beef
        ..start = DateTime(2019, random.nextInt(12) + 1, random.nextInt(28) + 1)
      ),
      Challenge((b) => b
        ..type = ChallengeType.beef
        ..start = DateTime(2019, random.nextInt(12) + 1, random.nextInt(28) + 1)
      ),
      Challenge((b) => b
        ..type = ChallengeType.beef
        ..start = DateTime(2019, random.nextInt(12) + 1, random.nextInt(28) + 1)
      ),
      Challenge((b) => b
        ..type = ChallengeType.beef
        ..start = DateTime(2019, random.nextInt(12) + 1, random.nextInt(28) + 1)
      ),
      Challenge((b) => b
        ..type = ChallengeType.beef
        ..start = DateTime(2019, random.nextInt(12) + 1, random.nextInt(28) + 1)
      ),Challenge((b) => b
        ..type = ChallengeType.beef
        ..start = DateTime(2019, random.nextInt(12) + 1, random.nextInt(28) + 1)
      ),

    ]).toBuilder(),
  );

  final Store<AppState> store = Store<AppState>(
      appStateReducer,
      initialState: initialState,
  );

  startTimeUpdater(
    store: store,
    interval: Duration(seconds: 2)
  );

  runApp(StoreProvider(
    store: store,
    child: MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.green,
        accentColor: Colors.white,
        textTheme: Typography.blackMountainView.merge(TextTheme(
          headline: TextStyle(
            fontWeight: FontWeight.w600,
          ),
          title: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
          subtitle: TextStyle(
            fontSize: 14,
            color: Color(0xFF8D8D8D),
          ),
          display1: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          button: TextStyle(
            fontSize: 17,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          body1: TextStyle(
            fontSize: 15,
            color: Color(0xFF434242),
          ),
        )),
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
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
      },
    ),
  ));
}
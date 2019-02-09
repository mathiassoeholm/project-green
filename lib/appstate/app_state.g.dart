// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final BuiltList<Challenge> challenges;
  @override
  final Time time;

  factory _$AppState([void updates(AppStateBuilder b)]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._({this.challenges, this.time}) : super._() {
    if (challenges == null) {
      throw new BuiltValueNullFieldError('AppState', 'challenges');
    }
    if (time == null) {
      throw new BuiltValueNullFieldError('AppState', 'time');
    }
  }

  @override
  AppState rebuild(void updates(AppStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        challenges == other.challenges &&
        time == other.time;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, challenges.hashCode), time.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('challenges', challenges)
          ..add('time', time))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  ListBuilder<Challenge> _challenges;
  ListBuilder<Challenge> get challenges =>
      _$this._challenges ??= new ListBuilder<Challenge>();
  set challenges(ListBuilder<Challenge> challenges) =>
      _$this._challenges = challenges;

  TimeBuilder _time;
  TimeBuilder get time => _$this._time ??= new TimeBuilder();
  set time(TimeBuilder time) => _$this._time = time;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _challenges = _$v.challenges?.toBuilder();
      _time = _$v.time?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void updates(AppStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(challenges: challenges.build(), time: time.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'challenges';
        challenges.build();
        _$failedField = 'time';
        time.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Time extends Time {
  @override
  final DateTime today;

  factory _$Time([void updates(TimeBuilder b)]) =>
      (new TimeBuilder()..update(updates)).build();

  _$Time._({this.today}) : super._() {
    if (today == null) {
      throw new BuiltValueNullFieldError('Time', 'today');
    }
  }

  @override
  Time rebuild(void updates(TimeBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TimeBuilder toBuilder() => new TimeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Time && today == other.today;
  }

  @override
  int get hashCode {
    return $jf($jc(0, today.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Time')..add('today', today))
        .toString();
  }
}

class TimeBuilder implements Builder<Time, TimeBuilder> {
  _$Time _$v;

  DateTime _today;
  DateTime get today => _$this._today;
  set today(DateTime today) => _$this._today = today;

  TimeBuilder();

  TimeBuilder get _$this {
    if (_$v != null) {
      _today = _$v.today;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Time other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Time;
  }

  @override
  void update(void updates(TimeBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Time build() {
    final _$result = _$v ?? new _$Time._(today: today);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

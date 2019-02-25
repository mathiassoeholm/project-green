// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Challenge extends Challenge {
  @override
  final String key;
  @override
  final ChallengeType type;
  @override
  final DateTime start;
  @override
  final BuiltList<DateTime> relapses;

  factory _$Challenge([void updates(ChallengeBuilder b)]) =>
      (new ChallengeBuilder()..update(updates)).build();

  _$Challenge._({this.key, this.type, this.start, this.relapses}) : super._() {
    if (key == null) {
      throw new BuiltValueNullFieldError('Challenge', 'key');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('Challenge', 'type');
    }
    if (start == null) {
      throw new BuiltValueNullFieldError('Challenge', 'start');
    }
    if (relapses == null) {
      throw new BuiltValueNullFieldError('Challenge', 'relapses');
    }
  }

  @override
  Challenge rebuild(void updates(ChallengeBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ChallengeBuilder toBuilder() => new ChallengeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Challenge &&
        key == other.key &&
        type == other.type &&
        start == other.start &&
        relapses == other.relapses;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, key.hashCode), type.hashCode), start.hashCode),
        relapses.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Challenge')
          ..add('key', key)
          ..add('type', type)
          ..add('start', start)
          ..add('relapses', relapses))
        .toString();
  }
}

class ChallengeBuilder implements Builder<Challenge, ChallengeBuilder> {
  _$Challenge _$v;

  String _key;
  String get key => _$this._key;
  set key(String key) => _$this._key = key;

  ChallengeType _type;
  ChallengeType get type => _$this._type;
  set type(ChallengeType type) => _$this._type = type;

  DateTime _start;
  DateTime get start => _$this._start;
  set start(DateTime start) => _$this._start = start;

  ListBuilder<DateTime> _relapses;
  ListBuilder<DateTime> get relapses =>
      _$this._relapses ??= new ListBuilder<DateTime>();
  set relapses(ListBuilder<DateTime> relapses) => _$this._relapses = relapses;

  ChallengeBuilder();

  ChallengeBuilder get _$this {
    if (_$v != null) {
      _key = _$v.key;
      _type = _$v.type;
      _start = _$v.start;
      _relapses = _$v.relapses?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Challenge other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Challenge;
  }

  @override
  void update(void updates(ChallengeBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Challenge build() {
    _$Challenge _$result;
    try {
      _$result = _$v ??
          new _$Challenge._(
              key: key, type: type, start: start, relapses: relapses.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'relapses';
        relapses.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Challenge', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

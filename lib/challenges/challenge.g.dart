// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Challenge extends Challenge {
  @override
  final ChallengeType type;

  factory _$Challenge([void updates(ChallengeBuilder b)]) =>
      (new ChallengeBuilder()..update(updates)).build();

  _$Challenge._({this.type}) : super._() {
    if (type == null) {
      throw new BuiltValueNullFieldError('Challenge', 'type');
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
    return other is Challenge && type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc(0, type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Challenge')..add('type', type))
        .toString();
  }
}

class ChallengeBuilder implements Builder<Challenge, ChallengeBuilder> {
  _$Challenge _$v;

  ChallengeType _type;
  ChallengeType get type => _$this._type;
  set type(ChallengeType type) => _$this._type = type;

  ChallengeBuilder();

  ChallengeBuilder get _$this {
    if (_$v != null) {
      _type = _$v.type;
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
    final _$result = _$v ?? new _$Challenge._(type: type);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

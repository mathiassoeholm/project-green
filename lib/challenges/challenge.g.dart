// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Challenge extends Challenge {
  @override
  final String emoji;

  factory _$Challenge([void updates(ChallengeBuilder b)]) =>
      (new ChallengeBuilder()..update(updates)).build();

  _$Challenge._({this.emoji}) : super._() {
    if (emoji == null) {
      throw new BuiltValueNullFieldError('Challenge', 'emoji');
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
    return other is Challenge && emoji == other.emoji;
  }

  @override
  int get hashCode {
    return $jf($jc(0, emoji.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Challenge')..add('emoji', emoji))
        .toString();
  }
}

class ChallengeBuilder implements Builder<Challenge, ChallengeBuilder> {
  _$Challenge _$v;

  String _emoji;
  String get emoji => _$this._emoji;
  set emoji(String emoji) => _$this._emoji = emoji;

  ChallengeBuilder();

  ChallengeBuilder get _$this {
    if (_$v != null) {
      _emoji = _$v.emoji;
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
    final _$result = _$v ?? new _$Challenge._(emoji: emoji);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

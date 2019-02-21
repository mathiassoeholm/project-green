// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$User extends User {
  @override
  final String displayName;
  @override
  final String photoURL;
  @override
  final int totalPoints;

  factory _$User([void updates(UserBuilder b)]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._({this.displayName, this.photoURL, this.totalPoints}) : super._() {
    if (displayName == null) {
      throw new BuiltValueNullFieldError('User', 'displayName');
    }
    if (photoURL == null) {
      throw new BuiltValueNullFieldError('User', 'photoURL');
    }
    if (totalPoints == null) {
      throw new BuiltValueNullFieldError('User', 'totalPoints');
    }
  }

  @override
  User rebuild(void updates(UserBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        displayName == other.displayName &&
        photoURL == other.photoURL &&
        totalPoints == other.totalPoints;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, displayName.hashCode), photoURL.hashCode),
        totalPoints.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('displayName', displayName)
          ..add('photoURL', photoURL)
          ..add('totalPoints', totalPoints))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User _$v;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _photoURL;
  String get photoURL => _$this._photoURL;
  set photoURL(String photoURL) => _$this._photoURL = photoURL;

  int _totalPoints;
  int get totalPoints => _$this._totalPoints;
  set totalPoints(int totalPoints) => _$this._totalPoints = totalPoints;

  UserBuilder();

  UserBuilder get _$this {
    if (_$v != null) {
      _displayName = _$v.displayName;
      _photoURL = _$v.photoURL;
      _totalPoints = _$v.totalPoints;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$User;
  }

  @override
  void update(void updates(UserBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    final _$result = _$v ??
        new _$User._(
            displayName: displayName,
            photoURL: photoURL,
            totalPoints: totalPoints);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

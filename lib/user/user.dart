import 'package:built_value/built_value.dart';
import 'package:project_green/challenges/challenge_type.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  String get displayName;

  String get photoURL;

  User._();
  factory User([updates(UserBuilder b)]) = _$User;
}
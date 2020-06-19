library models;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
/// For use when you have a JSON response with a list
import 'package:built_value/standard_json_plugin.dart';

part 'auth.dart';
part 'virus.dart';

// Generated model files
part '_index.g.dart';

@SerializersFor(const [
  SignInCredsRequest,
  AuthResponse,
  Virus,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

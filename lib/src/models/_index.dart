library models;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
/// For use when you have a JSON response with a list
// import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'auth.dart';

// Generated model files
part '_index.g.dart';

@SerializersFor(const [
  SignInCredsRequest,
  AuthResponse,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

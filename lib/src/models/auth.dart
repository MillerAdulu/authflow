part of models;

enum AuthStatus { LOGGED_OUT, LOGGED_IN }

abstract class SignInCredsRequest
    implements Built<SignInCredsRequest, SignInCredsRequestBuilder> {
  String get email;

  String get password;

  SignInCredsRequest._();

  factory SignInCredsRequest(
          [void Function(SignInCredsRequestBuilder) updates]) =
      _$SignInCredsRequest;

  String toJson() {
    return json
        .encode(serializers.serializeWith(SignInCredsRequest.serializer, this));
  }

  static SignInCredsRequest fromJson(Map<String, String> response) {
    return serializers.deserializeWith(
      SignInCredsRequest.serializer,
      response,
    );
  }

  static Serializer<SignInCredsRequest> get serializer =>
      _$signInCredsRequestSerializer;
}

abstract class AuthResponse
    implements Built<AuthResponse, AuthResponseBuilder> {
  String get token;

  AuthResponse._();

  factory AuthResponse([void Function(AuthResponseBuilder) updates]) =
      _$AuthResponse;

  String toJson() {
    return json.encode(
      serializers.serializeWith(AuthResponse.serializer, this),
    );
  }

  static AuthResponse fromJson(Map<String, dynamic> response) {
    return serializers.deserializeWith(
      AuthResponse.serializer,
      response,
    );
  }

  static Serializer<AuthResponse> get serializer => _$authResponseSerializer;
}

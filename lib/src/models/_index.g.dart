// GENERATED CODE - DO NOT MODIFY BY HAND

part of models;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(AuthResponse.serializer)
      ..add(SignInCredsRequest.serializer))
    .build();
Serializer<SignInCredsRequest> _$signInCredsRequestSerializer =
    new _$SignInCredsRequestSerializer();
Serializer<AuthResponse> _$authResponseSerializer =
    new _$AuthResponseSerializer();

class _$SignInCredsRequestSerializer
    implements StructuredSerializer<SignInCredsRequest> {
  @override
  final Iterable<Type> types = const [SignInCredsRequest, _$SignInCredsRequest];
  @override
  final String wireName = 'SignInCredsRequest';

  @override
  Iterable<Object> serialize(Serializers serializers, SignInCredsRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SignInCredsRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SignInCredsRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthResponseSerializer implements StructuredSerializer<AuthResponse> {
  @override
  final Iterable<Type> types = const [AuthResponse, _$AuthResponse];
  @override
  final String wireName = 'AuthResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, AuthResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  AuthResponse deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SignInCredsRequest extends SignInCredsRequest {
  @override
  final String email;
  @override
  final String password;

  factory _$SignInCredsRequest(
          [void Function(SignInCredsRequestBuilder) updates]) =>
      (new SignInCredsRequestBuilder()..update(updates)).build();

  _$SignInCredsRequest._({this.email, this.password}) : super._() {
    if (email == null) {
      throw new BuiltValueNullFieldError('SignInCredsRequest', 'email');
    }
    if (password == null) {
      throw new BuiltValueNullFieldError('SignInCredsRequest', 'password');
    }
  }

  @override
  SignInCredsRequest rebuild(
          void Function(SignInCredsRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignInCredsRequestBuilder toBuilder() =>
      new SignInCredsRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignInCredsRequest &&
        email == other.email &&
        password == other.password;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, email.hashCode), password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SignInCredsRequest')
          ..add('email', email)
          ..add('password', password))
        .toString();
  }
}

class SignInCredsRequestBuilder
    implements Builder<SignInCredsRequest, SignInCredsRequestBuilder> {
  _$SignInCredsRequest _$v;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  SignInCredsRequestBuilder();

  SignInCredsRequestBuilder get _$this {
    if (_$v != null) {
      _email = _$v.email;
      _password = _$v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignInCredsRequest other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignInCredsRequest;
  }

  @override
  void update(void Function(SignInCredsRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignInCredsRequest build() {
    final _$result =
        _$v ?? new _$SignInCredsRequest._(email: email, password: password);
    replace(_$result);
    return _$result;
  }
}

class _$AuthResponse extends AuthResponse {
  @override
  final String token;

  factory _$AuthResponse([void Function(AuthResponseBuilder) updates]) =>
      (new AuthResponseBuilder()..update(updates)).build();

  _$AuthResponse._({this.token}) : super._() {
    if (token == null) {
      throw new BuiltValueNullFieldError('AuthResponse', 'token');
    }
  }

  @override
  AuthResponse rebuild(void Function(AuthResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthResponseBuilder toBuilder() => new AuthResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthResponse && token == other.token;
  }

  @override
  int get hashCode {
    return $jf($jc(0, token.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthResponse')..add('token', token))
        .toString();
  }
}

class AuthResponseBuilder
    implements Builder<AuthResponse, AuthResponseBuilder> {
  _$AuthResponse _$v;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  AuthResponseBuilder();

  AuthResponseBuilder get _$this {
    if (_$v != null) {
      _token = _$v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AuthResponse;
  }

  @override
  void update(void Function(AuthResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthResponse build() {
    final _$result = _$v ?? new _$AuthResponse._(token: token);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

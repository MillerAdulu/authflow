// GENERATED CODE - DO NOT MODIFY BY HAND

part of models;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(AuthResponse.serializer)
      ..add(SignInCredsRequest.serializer)
      ..add(Virus.serializer))
    .build();
Serializer<SignInCredsRequest> _$signInCredsRequestSerializer =
    new _$SignInCredsRequestSerializer();
Serializer<AuthResponse> _$authResponseSerializer =
    new _$AuthResponseSerializer();
Serializer<Virus> _$virusSerializer = new _$VirusSerializer();

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

class _$VirusSerializer implements StructuredSerializer<Virus> {
  @override
  final Iterable<Type> types = const [Virus, _$Virus];
  @override
  final String wireName = 'Virus';

  @override
  Iterable<Object> serialize(Serializers serializers, Virus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.virusName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Virus deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VirusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.virusName = serializers.deserialize(value,
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

class _$Virus extends Virus {
  @override
  final int id;
  @override
  final String virusName;

  factory _$Virus([void Function(VirusBuilder) updates]) =>
      (new VirusBuilder()..update(updates)).build();

  _$Virus._({this.id, this.virusName}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Virus', 'id');
    }
    if (virusName == null) {
      throw new BuiltValueNullFieldError('Virus', 'virusName');
    }
  }

  @override
  Virus rebuild(void Function(VirusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VirusBuilder toBuilder() => new VirusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Virus && id == other.id && virusName == other.virusName;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), virusName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Virus')
          ..add('id', id)
          ..add('virusName', virusName))
        .toString();
  }
}

class VirusBuilder implements Builder<Virus, VirusBuilder> {
  _$Virus _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _virusName;
  String get virusName => _$this._virusName;
  set virusName(String virusName) => _$this._virusName = virusName;

  VirusBuilder();

  VirusBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _virusName = _$v.virusName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Virus other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Virus;
  }

  @override
  void update(void Function(VirusBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Virus build() {
    final _$result = _$v ?? new _$Virus._(id: id, virusName: virusName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

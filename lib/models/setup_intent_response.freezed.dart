// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setup_intent_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SetupIntentResponse _$SetupIntentResponseFromJson(Map<String, dynamic> json) {
  return _SetupIntentResponse.fromJson(json);
}

/// @nodoc
mixin _$SetupIntentResponse {
  @JsonKey(name: "client_secret")
  String get clientSecret => throw _privateConstructorUsedError;

  /// Serializes this SetupIntentResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SetupIntentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SetupIntentResponseCopyWith<SetupIntentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetupIntentResponseCopyWith<$Res> {
  factory $SetupIntentResponseCopyWith(
          SetupIntentResponse value, $Res Function(SetupIntentResponse) then) =
      _$SetupIntentResponseCopyWithImpl<$Res, SetupIntentResponse>;
  @useResult
  $Res call({@JsonKey(name: "client_secret") String clientSecret});
}

/// @nodoc
class _$SetupIntentResponseCopyWithImpl<$Res, $Val extends SetupIntentResponse>
    implements $SetupIntentResponseCopyWith<$Res> {
  _$SetupIntentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SetupIntentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientSecret = null,
  }) {
    return _then(_value.copyWith(
      clientSecret: null == clientSecret
          ? _value.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SetupIntentResponseImplCopyWith<$Res>
    implements $SetupIntentResponseCopyWith<$Res> {
  factory _$$SetupIntentResponseImplCopyWith(_$SetupIntentResponseImpl value,
          $Res Function(_$SetupIntentResponseImpl) then) =
      __$$SetupIntentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "client_secret") String clientSecret});
}

/// @nodoc
class __$$SetupIntentResponseImplCopyWithImpl<$Res>
    extends _$SetupIntentResponseCopyWithImpl<$Res, _$SetupIntentResponseImpl>
    implements _$$SetupIntentResponseImplCopyWith<$Res> {
  __$$SetupIntentResponseImplCopyWithImpl(_$SetupIntentResponseImpl _value,
      $Res Function(_$SetupIntentResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SetupIntentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientSecret = null,
  }) {
    return _then(_$SetupIntentResponseImpl(
      clientSecret: null == clientSecret
          ? _value.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SetupIntentResponseImpl implements _SetupIntentResponse {
  const _$SetupIntentResponseImpl(
      {@JsonKey(name: "client_secret") required this.clientSecret});

  factory _$SetupIntentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SetupIntentResponseImplFromJson(json);

  @override
  @JsonKey(name: "client_secret")
  final String clientSecret;

  @override
  String toString() {
    return 'SetupIntentResponse(clientSecret: $clientSecret)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetupIntentResponseImpl &&
            (identical(other.clientSecret, clientSecret) ||
                other.clientSecret == clientSecret));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, clientSecret);

  /// Create a copy of SetupIntentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetupIntentResponseImplCopyWith<_$SetupIntentResponseImpl> get copyWith =>
      __$$SetupIntentResponseImplCopyWithImpl<_$SetupIntentResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SetupIntentResponseImplToJson(
      this,
    );
  }
}

abstract class _SetupIntentResponse implements SetupIntentResponse {
  const factory _SetupIntentResponse(
      {@JsonKey(name: "client_secret")
      required final String clientSecret}) = _$SetupIntentResponseImpl;

  factory _SetupIntentResponse.fromJson(Map<String, dynamic> json) =
      _$SetupIntentResponseImpl.fromJson;

  @override
  @JsonKey(name: "client_secret")
  String get clientSecret;

  /// Create a copy of SetupIntentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetupIntentResponseImplCopyWith<_$SetupIntentResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

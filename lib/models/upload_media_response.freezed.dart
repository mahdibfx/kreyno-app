// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_media_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UploadMediaResponse _$UploadMediaResponseFromJson(Map<String, dynamic> json) {
  return _UploadMediaResponse.fromJson(json);
}

/// @nodoc
mixin _$UploadMediaResponse {
  @JsonKey(name: 'uuid')
  String get uuid => throw _privateConstructorUsedError;

  /// Serializes this UploadMediaResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadMediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadMediaResponseCopyWith<UploadMediaResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadMediaResponseCopyWith<$Res> {
  factory $UploadMediaResponseCopyWith(
          UploadMediaResponse value, $Res Function(UploadMediaResponse) then) =
      _$UploadMediaResponseCopyWithImpl<$Res, UploadMediaResponse>;
  @useResult
  $Res call({@JsonKey(name: 'uuid') String uuid});
}

/// @nodoc
class _$UploadMediaResponseCopyWithImpl<$Res, $Val extends UploadMediaResponse>
    implements $UploadMediaResponseCopyWith<$Res> {
  _$UploadMediaResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadMediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadMediaResponseImplCopyWith<$Res>
    implements $UploadMediaResponseCopyWith<$Res> {
  factory _$$UploadMediaResponseImplCopyWith(_$UploadMediaResponseImpl value,
          $Res Function(_$UploadMediaResponseImpl) then) =
      __$$UploadMediaResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'uuid') String uuid});
}

/// @nodoc
class __$$UploadMediaResponseImplCopyWithImpl<$Res>
    extends _$UploadMediaResponseCopyWithImpl<$Res, _$UploadMediaResponseImpl>
    implements _$$UploadMediaResponseImplCopyWith<$Res> {
  __$$UploadMediaResponseImplCopyWithImpl(_$UploadMediaResponseImpl _value,
      $Res Function(_$UploadMediaResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadMediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
  }) {
    return _then(_$UploadMediaResponseImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadMediaResponseImpl implements _UploadMediaResponse {
  const _$UploadMediaResponseImpl({@JsonKey(name: 'uuid') required this.uuid});

  factory _$UploadMediaResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadMediaResponseImplFromJson(json);

  @override
  @JsonKey(name: 'uuid')
  final String uuid;

  @override
  String toString() {
    return 'UploadMediaResponse(uuid: $uuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadMediaResponseImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uuid);

  /// Create a copy of UploadMediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadMediaResponseImplCopyWith<_$UploadMediaResponseImpl> get copyWith =>
      __$$UploadMediaResponseImplCopyWithImpl<_$UploadMediaResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadMediaResponseImplToJson(
      this,
    );
  }
}

abstract class _UploadMediaResponse implements UploadMediaResponse {
  const factory _UploadMediaResponse(
          {@JsonKey(name: 'uuid') required final String uuid}) =
      _$UploadMediaResponseImpl;

  factory _UploadMediaResponse.fromJson(Map<String, dynamic> json) =
      _$UploadMediaResponseImpl.fromJson;

  @override
  @JsonKey(name: 'uuid')
  String get uuid;

  /// Create a copy of UploadMediaResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadMediaResponseImplCopyWith<_$UploadMediaResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

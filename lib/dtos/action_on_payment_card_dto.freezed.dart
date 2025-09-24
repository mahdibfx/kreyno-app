// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'action_on_payment_card_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActionOnPaymentCardDto _$ActionOnPaymentCardDtoFromJson(
    Map<String, dynamic> json) {
  return _ActionOnPaymentCardDto.fromJson(json);
}

/// @nodoc
mixin _$ActionOnPaymentCardDto {
  @JsonKey(name: "payment_method")
  String get paymentMethodId => throw _privateConstructorUsedError;

  /// Serializes this ActionOnPaymentCardDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActionOnPaymentCardDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActionOnPaymentCardDtoCopyWith<ActionOnPaymentCardDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionOnPaymentCardDtoCopyWith<$Res> {
  factory $ActionOnPaymentCardDtoCopyWith(ActionOnPaymentCardDto value,
          $Res Function(ActionOnPaymentCardDto) then) =
      _$ActionOnPaymentCardDtoCopyWithImpl<$Res, ActionOnPaymentCardDto>;
  @useResult
  $Res call({@JsonKey(name: "payment_method") String paymentMethodId});
}

/// @nodoc
class _$ActionOnPaymentCardDtoCopyWithImpl<$Res,
        $Val extends ActionOnPaymentCardDto>
    implements $ActionOnPaymentCardDtoCopyWith<$Res> {
  _$ActionOnPaymentCardDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActionOnPaymentCardDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethodId = null,
  }) {
    return _then(_value.copyWith(
      paymentMethodId: null == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActionOnPaymentCardDtoImplCopyWith<$Res>
    implements $ActionOnPaymentCardDtoCopyWith<$Res> {
  factory _$$ActionOnPaymentCardDtoImplCopyWith(
          _$ActionOnPaymentCardDtoImpl value,
          $Res Function(_$ActionOnPaymentCardDtoImpl) then) =
      __$$ActionOnPaymentCardDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "payment_method") String paymentMethodId});
}

/// @nodoc
class __$$ActionOnPaymentCardDtoImplCopyWithImpl<$Res>
    extends _$ActionOnPaymentCardDtoCopyWithImpl<$Res,
        _$ActionOnPaymentCardDtoImpl>
    implements _$$ActionOnPaymentCardDtoImplCopyWith<$Res> {
  __$$ActionOnPaymentCardDtoImplCopyWithImpl(
      _$ActionOnPaymentCardDtoImpl _value,
      $Res Function(_$ActionOnPaymentCardDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActionOnPaymentCardDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethodId = null,
  }) {
    return _then(_$ActionOnPaymentCardDtoImpl(
      paymentMethodId: null == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActionOnPaymentCardDtoImpl implements _ActionOnPaymentCardDto {
  const _$ActionOnPaymentCardDtoImpl(
      {@JsonKey(name: "payment_method") required this.paymentMethodId});

  factory _$ActionOnPaymentCardDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActionOnPaymentCardDtoImplFromJson(json);

  @override
  @JsonKey(name: "payment_method")
  final String paymentMethodId;

  @override
  String toString() {
    return 'ActionOnPaymentCardDto(paymentMethodId: $paymentMethodId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionOnPaymentCardDtoImpl &&
            (identical(other.paymentMethodId, paymentMethodId) ||
                other.paymentMethodId == paymentMethodId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, paymentMethodId);

  /// Create a copy of ActionOnPaymentCardDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionOnPaymentCardDtoImplCopyWith<_$ActionOnPaymentCardDtoImpl>
      get copyWith => __$$ActionOnPaymentCardDtoImplCopyWithImpl<
          _$ActionOnPaymentCardDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActionOnPaymentCardDtoImplToJson(
      this,
    );
  }
}

abstract class _ActionOnPaymentCardDto implements ActionOnPaymentCardDto {
  const factory _ActionOnPaymentCardDto(
      {@JsonKey(name: "payment_method")
      required final String paymentMethodId}) = _$ActionOnPaymentCardDtoImpl;

  factory _ActionOnPaymentCardDto.fromJson(Map<String, dynamic> json) =
      _$ActionOnPaymentCardDtoImpl.fromJson;

  @override
  @JsonKey(name: "payment_method")
  String get paymentMethodId;

  /// Create a copy of ActionOnPaymentCardDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActionOnPaymentCardDtoImplCopyWith<_$ActionOnPaymentCardDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Car {

@JsonKey(name: "id") int get id;@JsonKey(name: "car_type") VehicleType get vehicleType;@JsonKey(name: "brand") String get brand;@JsonKey(name: "model") String get model;@JsonKey(name: "color") String get color;@JsonKey(name: "registration_number") String get registrationNumber;@JsonKey(name: "co2_emission") num get co2Emission;@JsonKey(name: "is_selected") bool get isSelected;@JsonKey(name: "image", fromJson: _imageFromJson, toJson: _imageToJson)@JsonKey(name: "image") Image? get image;
/// Create a copy of Car
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarCopyWith<Car> get copyWith => _$CarCopyWithImpl<Car>(this as Car, _$identity);

  /// Serializes this Car to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Car&&(identical(other.id, id) || other.id == id)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.color, color) || other.color == color)&&(identical(other.registrationNumber, registrationNumber) || other.registrationNumber == registrationNumber)&&(identical(other.co2Emission, co2Emission) || other.co2Emission == co2Emission)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,vehicleType,brand,model,color,registrationNumber,co2Emission,isSelected,image);

@override
String toString() {
  return 'Car(id: $id, vehicleType: $vehicleType, brand: $brand, model: $model, color: $color, registrationNumber: $registrationNumber, co2Emission: $co2Emission, isSelected: $isSelected, image: $image)';
}


}

/// @nodoc
abstract mixin class $CarCopyWith<$Res>  {
  factory $CarCopyWith(Car value, $Res Function(Car) _then) = _$CarCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "car_type") VehicleType vehicleType,@JsonKey(name: "brand") String brand,@JsonKey(name: "model") String model,@JsonKey(name: "color") String color,@JsonKey(name: "registration_number") String registrationNumber,@JsonKey(name: "co2_emission") num co2Emission,@JsonKey(name: "is_selected") bool isSelected,@JsonKey(name: "image", fromJson: _imageFromJson, toJson: _imageToJson)@JsonKey(name: "image") Image? image
});


$ImageCopyWith<$Res>? get image;

}
/// @nodoc
class _$CarCopyWithImpl<$Res>
    implements $CarCopyWith<$Res> {
  _$CarCopyWithImpl(this._self, this._then);

  final Car _self;
  final $Res Function(Car) _then;

/// Create a copy of Car
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? vehicleType = null,Object? brand = null,Object? model = null,Object? color = null,Object? registrationNumber = null,Object? co2Emission = null,Object? isSelected = null,Object? image = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as VehicleType,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,registrationNumber: null == registrationNumber ? _self.registrationNumber : registrationNumber // ignore: cast_nullable_to_non_nullable
as String,co2Emission: null == co2Emission ? _self.co2Emission : co2Emission // ignore: cast_nullable_to_non_nullable
as num,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Image?,
  ));
}
/// Create a copy of Car
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $ImageCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}


/// Adds pattern-matching-related methods to [Car].
extension CarPatterns on Car {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Car value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Car() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Car value)  $default,){
final _that = this;
switch (_that) {
case _Car():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Car value)?  $default,){
final _that = this;
switch (_that) {
case _Car() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "car_type")  VehicleType vehicleType, @JsonKey(name: "brand")  String brand, @JsonKey(name: "model")  String model, @JsonKey(name: "color")  String color, @JsonKey(name: "registration_number")  String registrationNumber, @JsonKey(name: "co2_emission")  num co2Emission, @JsonKey(name: "is_selected")  bool isSelected, @JsonKey(name: "image", fromJson: _imageFromJson, toJson: _imageToJson)@JsonKey(name: "image")  Image? image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Car() when $default != null:
return $default(_that.id,_that.vehicleType,_that.brand,_that.model,_that.color,_that.registrationNumber,_that.co2Emission,_that.isSelected,_that.image);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "car_type")  VehicleType vehicleType, @JsonKey(name: "brand")  String brand, @JsonKey(name: "model")  String model, @JsonKey(name: "color")  String color, @JsonKey(name: "registration_number")  String registrationNumber, @JsonKey(name: "co2_emission")  num co2Emission, @JsonKey(name: "is_selected")  bool isSelected, @JsonKey(name: "image", fromJson: _imageFromJson, toJson: _imageToJson)@JsonKey(name: "image")  Image? image)  $default,) {final _that = this;
switch (_that) {
case _Car():
return $default(_that.id,_that.vehicleType,_that.brand,_that.model,_that.color,_that.registrationNumber,_that.co2Emission,_that.isSelected,_that.image);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int id, @JsonKey(name: "car_type")  VehicleType vehicleType, @JsonKey(name: "brand")  String brand, @JsonKey(name: "model")  String model, @JsonKey(name: "color")  String color, @JsonKey(name: "registration_number")  String registrationNumber, @JsonKey(name: "co2_emission")  num co2Emission, @JsonKey(name: "is_selected")  bool isSelected, @JsonKey(name: "image", fromJson: _imageFromJson, toJson: _imageToJson)@JsonKey(name: "image")  Image? image)?  $default,) {final _that = this;
switch (_that) {
case _Car() when $default != null:
return $default(_that.id,_that.vehicleType,_that.brand,_that.model,_that.color,_that.registrationNumber,_that.co2Emission,_that.isSelected,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Car implements Car {
  const _Car({@JsonKey(name: "id") required this.id, @JsonKey(name: "car_type") required this.vehicleType, @JsonKey(name: "brand") required this.brand, @JsonKey(name: "model") required this.model, @JsonKey(name: "color") required this.color, @JsonKey(name: "registration_number") required this.registrationNumber, @JsonKey(name: "co2_emission") required this.co2Emission, @JsonKey(name: "is_selected") this.isSelected = false, @JsonKey(name: "image", fromJson: _imageFromJson, toJson: _imageToJson)@JsonKey(name: "image") this.image});
  factory _Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

@override@JsonKey(name: "id") final  int id;
@override@JsonKey(name: "car_type") final  VehicleType vehicleType;
@override@JsonKey(name: "brand") final  String brand;
@override@JsonKey(name: "model") final  String model;
@override@JsonKey(name: "color") final  String color;
@override@JsonKey(name: "registration_number") final  String registrationNumber;
@override@JsonKey(name: "co2_emission") final  num co2Emission;
@override@JsonKey(name: "is_selected") final  bool isSelected;
@override@JsonKey(name: "image", fromJson: _imageFromJson, toJson: _imageToJson)@JsonKey(name: "image") final  Image? image;

/// Create a copy of Car
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarCopyWith<_Car> get copyWith => __$CarCopyWithImpl<_Car>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CarToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Car&&(identical(other.id, id) || other.id == id)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.color, color) || other.color == color)&&(identical(other.registrationNumber, registrationNumber) || other.registrationNumber == registrationNumber)&&(identical(other.co2Emission, co2Emission) || other.co2Emission == co2Emission)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,vehicleType,brand,model,color,registrationNumber,co2Emission,isSelected,image);

@override
String toString() {
  return 'Car(id: $id, vehicleType: $vehicleType, brand: $brand, model: $model, color: $color, registrationNumber: $registrationNumber, co2Emission: $co2Emission, isSelected: $isSelected, image: $image)';
}


}

/// @nodoc
abstract mixin class _$CarCopyWith<$Res> implements $CarCopyWith<$Res> {
  factory _$CarCopyWith(_Car value, $Res Function(_Car) _then) = __$CarCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "car_type") VehicleType vehicleType,@JsonKey(name: "brand") String brand,@JsonKey(name: "model") String model,@JsonKey(name: "color") String color,@JsonKey(name: "registration_number") String registrationNumber,@JsonKey(name: "co2_emission") num co2Emission,@JsonKey(name: "is_selected") bool isSelected,@JsonKey(name: "image", fromJson: _imageFromJson, toJson: _imageToJson)@JsonKey(name: "image") Image? image
});


@override $ImageCopyWith<$Res>? get image;

}
/// @nodoc
class __$CarCopyWithImpl<$Res>
    implements _$CarCopyWith<$Res> {
  __$CarCopyWithImpl(this._self, this._then);

  final _Car _self;
  final $Res Function(_Car) _then;

/// Create a copy of Car
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? vehicleType = null,Object? brand = null,Object? model = null,Object? color = null,Object? registrationNumber = null,Object? co2Emission = null,Object? isSelected = null,Object? image = freezed,}) {
  return _then(_Car(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,vehicleType: null == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as VehicleType,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,registrationNumber: null == registrationNumber ? _self.registrationNumber : registrationNumber // ignore: cast_nullable_to_non_nullable
as String,co2Emission: null == co2Emission ? _self.co2Emission : co2Emission // ignore: cast_nullable_to_non_nullable
as num,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Image?,
  ));
}

/// Create a copy of Car
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $ImageCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}


/// @nodoc
mixin _$Image {

@JsonKey(name: "id") int get id;@JsonKey(name: "url") String get url;
/// Create a copy of Image
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageCopyWith<Image> get copyWith => _$ImageCopyWithImpl<Image>(this as Image, _$identity);

  /// Serializes this Image to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Image&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url);

@override
String toString() {
  return 'Image(id: $id, url: $url)';
}


}

/// @nodoc
abstract mixin class $ImageCopyWith<$Res>  {
  factory $ImageCopyWith(Image value, $Res Function(Image) _then) = _$ImageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "url") String url
});




}
/// @nodoc
class _$ImageCopyWithImpl<$Res>
    implements $ImageCopyWith<$Res> {
  _$ImageCopyWithImpl(this._self, this._then);

  final Image _self;
  final $Res Function(Image) _then;

/// Create a copy of Image
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Image].
extension ImagePatterns on Image {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Image value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Image() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Image value)  $default,){
final _that = this;
switch (_that) {
case _Image():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Image value)?  $default,){
final _that = this;
switch (_that) {
case _Image() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "url")  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Image() when $default != null:
return $default(_that.id,_that.url);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "url")  String url)  $default,) {final _that = this;
switch (_that) {
case _Image():
return $default(_that.id,_that.url);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int id, @JsonKey(name: "url")  String url)?  $default,) {final _that = this;
switch (_that) {
case _Image() when $default != null:
return $default(_that.id,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Image implements Image {
  const _Image({@JsonKey(name: "id") required this.id, @JsonKey(name: "url") required this.url});
  factory _Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

@override@JsonKey(name: "id") final  int id;
@override@JsonKey(name: "url") final  String url;

/// Create a copy of Image
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageCopyWith<_Image> get copyWith => __$ImageCopyWithImpl<_Image>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Image&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url);

@override
String toString() {
  return 'Image(id: $id, url: $url)';
}


}

/// @nodoc
abstract mixin class _$ImageCopyWith<$Res> implements $ImageCopyWith<$Res> {
  factory _$ImageCopyWith(_Image value, $Res Function(_Image) _then) = __$ImageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "url") String url
});




}
/// @nodoc
class __$ImageCopyWithImpl<$Res>
    implements _$ImageCopyWith<$Res> {
  __$ImageCopyWithImpl(this._self, this._then);

  final _Image _self;
  final $Res Function(_Image) _then;

/// Create a copy of Image
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? url = null,}) {
  return _then(_Image(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

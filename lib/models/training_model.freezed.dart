// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TrainingModel _$TrainingModelFromJson(Map<String, dynamic> json) {
  return _TrainingModel.fromJson(json);
}

TrainingModel _$TrainingModelFromJson1(Map<String, dynamic> json) {
  return _TrainingModel.fromJson1(json);
}

TrainingModel _$TrainingModelFromJson2(Map<String, dynamic> json) {
  return _TrainingModel.fromJson2(json);
}

TrainingModel _$TrainingModelFromJson3(Map<String, dynamic> json) {
  return _TrainingModel.fromJson3(json);
}

TrainingModel _$TrainingModelFromJson4(Map<String, dynamic> json) {
  return _TrainingModel.fromJson4(json);
}

TrainingModel _$TrainingModelFromJson5(Map<String, dynamic> json) {
  return _TrainingModel.fromJson5(json);
}

TrainingModel _$TrainingModelFromJson6(Map<String, dynamic> json) {
  return _TrainingModel.fromJson6(json);
}

/// @nodoc
mixin _$TrainingModel {
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  int get series => throw _privateConstructorUsedError;
  int get repeat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrainingModelCopyWith<TrainingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainingModelCopyWith<$Res> {
  factory $TrainingModelCopyWith(
          TrainingModel value, $Res Function(TrainingModel) then) =
      _$TrainingModelCopyWithImpl<$Res, TrainingModel>;
  @useResult
  $Res call({String name, String id, int series, int repeat});
}

/// @nodoc
class _$TrainingModelCopyWithImpl<$Res, $Val extends TrainingModel>
    implements $TrainingModelCopyWith<$Res> {
  _$TrainingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? series = null,
    Object? repeat = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      series: null == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as int,
      repeat: null == repeat
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TrainingModelCopyWith<$Res>
    implements $TrainingModelCopyWith<$Res> {
  factory _$$_TrainingModelCopyWith(
          _$_TrainingModel value, $Res Function(_$_TrainingModel) then) =
      __$$_TrainingModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String id, int series, int repeat});
}

/// @nodoc
class __$$_TrainingModelCopyWithImpl<$Res>
    extends _$TrainingModelCopyWithImpl<$Res, _$_TrainingModel>
    implements _$$_TrainingModelCopyWith<$Res> {
  __$$_TrainingModelCopyWithImpl(
      _$_TrainingModel _value, $Res Function(_$_TrainingModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? series = null,
    Object? repeat = null,
  }) {
    return _then(_$_TrainingModel(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as int,
      null == repeat
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TrainingModel implements _TrainingModel {
  _$_TrainingModel(this.name, this.id, this.series, this.repeat);

  factory _$_TrainingModel.fromJson(Map<String, dynamic> json) =>
      _$$_TrainingModelFromJson(json);
  factory _$_TrainingModel.fromJson1(Map<String, dynamic> json) =>
      _$$_TrainingModelFromJson1(json);
  factory _$_TrainingModel.fromJson2(Map<String, dynamic> json) =>
      _$$_TrainingModelFromJson2(json);
  factory _$_TrainingModel.fromJson3(Map<String, dynamic> json) =>
      _$$_TrainingModelFromJson3(json);
  factory _$_TrainingModel.fromJson4(Map<String, dynamic> json) =>
      _$$_TrainingModelFromJson4(json);
  factory _$_TrainingModel.fromJson5(Map<String, dynamic> json) =>
      _$$_TrainingModelFromJson5(json);
  factory _$_TrainingModel.fromJson6(Map<String, dynamic> json) =>
      _$$_TrainingModelFromJson6(json);

  @override
  final String name;
  @override
  final String id;
  @override
  final int series;
  @override
  final int repeat;

  @override
  String toString() {
    return 'TrainingModel(name: $name, id: $id, series: $series, repeat: $repeat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrainingModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.series, series) || other.series == series) &&
            (identical(other.repeat, repeat) || other.repeat == repeat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id, series, repeat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrainingModelCopyWith<_$_TrainingModel> get copyWith =>
      __$$_TrainingModelCopyWithImpl<_$_TrainingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TrainingModelToJson(
      this,
    );
  }
}

abstract class _TrainingModel implements TrainingModel {
  factory _TrainingModel(final String name, final String id, final int series,
      final int repeat) = _$_TrainingModel;

  factory _TrainingModel.fromJson(Map<String, dynamic> json) =
      _$_TrainingModel.fromJson;
  factory _TrainingModel.fromJson1(Map<String, dynamic> json) =
      _$_TrainingModel.fromJson1;
  factory _TrainingModel.fromJson2(Map<String, dynamic> json) =
      _$_TrainingModel.fromJson2;
  factory _TrainingModel.fromJson3(Map<String, dynamic> json) =
      _$_TrainingModel.fromJson3;
  factory _TrainingModel.fromJson4(Map<String, dynamic> json) =
      _$_TrainingModel.fromJson4;
  factory _TrainingModel.fromJson5(Map<String, dynamic> json) =
      _$_TrainingModel.fromJson5;
  factory _TrainingModel.fromJson6(Map<String, dynamic> json) =
      _$_TrainingModel.fromJson6;

  @override
  String get name;
  @override
  String get id;
  @override
  int get series;
  @override
  int get repeat;
  @override
  @JsonKey(ignore: true)
  _$$_TrainingModelCopyWith<_$_TrainingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

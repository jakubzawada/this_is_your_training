// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_account_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyAccountState {
  bool get saved => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  File? get selectedImage => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyAccountStateCopyWith<MyAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyAccountStateCopyWith<$Res> {
  factory $MyAccountStateCopyWith(
          MyAccountState value, $Res Function(MyAccountState) then) =
      _$MyAccountStateCopyWithImpl<$Res, MyAccountState>;
  @useResult
  $Res call(
      {bool saved,
      String? errorMessage,
      File? selectedImage,
      User? user,
      String? avatarUrl});
}

/// @nodoc
class _$MyAccountStateCopyWithImpl<$Res, $Val extends MyAccountState>
    implements $MyAccountStateCopyWith<$Res> {
  _$MyAccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saved = null,
    Object? errorMessage = freezed,
    Object? selectedImage = freezed,
    Object? user = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(_value.copyWith(
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedImage: freezed == selectedImage
          ? _value.selectedImage
          : selectedImage // ignore: cast_nullable_to_non_nullable
              as File?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MyAccountStateCopyWith<$Res>
    implements $MyAccountStateCopyWith<$Res> {
  factory _$$_MyAccountStateCopyWith(
          _$_MyAccountState value, $Res Function(_$_MyAccountState) then) =
      __$$_MyAccountStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool saved,
      String? errorMessage,
      File? selectedImage,
      User? user,
      String? avatarUrl});
}

/// @nodoc
class __$$_MyAccountStateCopyWithImpl<$Res>
    extends _$MyAccountStateCopyWithImpl<$Res, _$_MyAccountState>
    implements _$$_MyAccountStateCopyWith<$Res> {
  __$$_MyAccountStateCopyWithImpl(
      _$_MyAccountState _value, $Res Function(_$_MyAccountState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saved = null,
    Object? errorMessage = freezed,
    Object? selectedImage = freezed,
    Object? user = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(_$_MyAccountState(
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedImage: freezed == selectedImage
          ? _value.selectedImage
          : selectedImage // ignore: cast_nullable_to_non_nullable
              as File?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_MyAccountState implements _MyAccountState {
  _$_MyAccountState(
      {this.saved = false,
      this.errorMessage,
      this.selectedImage,
      this.user,
      this.avatarUrl});

  @override
  @JsonKey()
  final bool saved;
  @override
  final String? errorMessage;
  @override
  final File? selectedImage;
  @override
  final User? user;
  @override
  final String? avatarUrl;

  @override
  String toString() {
    return 'MyAccountState(saved: $saved, errorMessage: $errorMessage, selectedImage: $selectedImage, user: $user, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyAccountState &&
            (identical(other.saved, saved) || other.saved == saved) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.selectedImage, selectedImage) ||
                other.selectedImage == selectedImage) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, saved, errorMessage, selectedImage, user, avatarUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyAccountStateCopyWith<_$_MyAccountState> get copyWith =>
      __$$_MyAccountStateCopyWithImpl<_$_MyAccountState>(this, _$identity);
}

abstract class _MyAccountState implements MyAccountState {
  factory _MyAccountState(
      {final bool saved,
      final String? errorMessage,
      final File? selectedImage,
      final User? user,
      final String? avatarUrl}) = _$_MyAccountState;

  @override
  bool get saved;
  @override
  String? get errorMessage;
  @override
  File? get selectedImage;
  @override
  User? get user;
  @override
  String? get avatarUrl;
  @override
  @JsonKey(ignore: true)
  _$$_MyAccountStateCopyWith<_$_MyAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

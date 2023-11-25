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
  Status get status => throw _privateConstructorUsedError;

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
      String? avatarUrl,
      Status status});
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
    Object? status = null,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyAccountStateImplCopyWith<$Res>
    implements $MyAccountStateCopyWith<$Res> {
  factory _$$MyAccountStateImplCopyWith(_$MyAccountStateImpl value,
          $Res Function(_$MyAccountStateImpl) then) =
      __$$MyAccountStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool saved,
      String? errorMessage,
      File? selectedImage,
      User? user,
      String? avatarUrl,
      Status status});
}

/// @nodoc
class __$$MyAccountStateImplCopyWithImpl<$Res>
    extends _$MyAccountStateCopyWithImpl<$Res, _$MyAccountStateImpl>
    implements _$$MyAccountStateImplCopyWith<$Res> {
  __$$MyAccountStateImplCopyWithImpl(
      _$MyAccountStateImpl _value, $Res Function(_$MyAccountStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saved = null,
    Object? errorMessage = freezed,
    Object? selectedImage = freezed,
    Object? user = freezed,
    Object? avatarUrl = freezed,
    Object? status = null,
  }) {
    return _then(_$MyAccountStateImpl(
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$MyAccountStateImpl implements _MyAccountState {
  _$MyAccountStateImpl(
      {this.saved = false,
      this.errorMessage,
      this.selectedImage,
      this.user,
      this.avatarUrl,
      this.status = Status.loading});

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
  @JsonKey()
  final Status status;

  @override
  String toString() {
    return 'MyAccountState(saved: $saved, errorMessage: $errorMessage, selectedImage: $selectedImage, user: $user, avatarUrl: $avatarUrl, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyAccountStateImpl &&
            (identical(other.saved, saved) || other.saved == saved) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.selectedImage, selectedImage) ||
                other.selectedImage == selectedImage) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, saved, errorMessage, selectedImage, user, avatarUrl, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyAccountStateImplCopyWith<_$MyAccountStateImpl> get copyWith =>
      __$$MyAccountStateImplCopyWithImpl<_$MyAccountStateImpl>(
          this, _$identity);
}

abstract class _MyAccountState implements MyAccountState {
  factory _MyAccountState(
      {final bool saved,
      final String? errorMessage,
      final File? selectedImage,
      final User? user,
      final String? avatarUrl,
      final Status status}) = _$MyAccountStateImpl;

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
  Status get status;
  @override
  @JsonKey(ignore: true)
  _$$MyAccountStateImplCopyWith<_$MyAccountStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

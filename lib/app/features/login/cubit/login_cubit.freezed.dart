// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginState {
  bool get isCreatingAccount => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  bool get obscureText => throw _privateConstructorUsedError;
  bool get isLoggingIn => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {bool isCreatingAccount,
      String errorMessage,
      bool obscureText,
      bool isLoggingIn,
      Status status});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCreatingAccount = null,
    Object? errorMessage = null,
    Object? obscureText = null,
    Object? isLoggingIn = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      isCreatingAccount: null == isCreatingAccount
          ? _value.isCreatingAccount
          : isCreatingAccount // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      obscureText: null == obscureText
          ? _value.obscureText
          : obscureText // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggingIn: null == isLoggingIn
          ? _value.isLoggingIn
          : isLoggingIn // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
          _$LoginStateImpl value, $Res Function(_$LoginStateImpl) then) =
      __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isCreatingAccount,
      String errorMessage,
      bool obscureText,
      bool isLoggingIn,
      Status status});
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
      _$LoginStateImpl _value, $Res Function(_$LoginStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCreatingAccount = null,
    Object? errorMessage = null,
    Object? obscureText = null,
    Object? isLoggingIn = null,
    Object? status = null,
  }) {
    return _then(_$LoginStateImpl(
      isCreatingAccount: null == isCreatingAccount
          ? _value.isCreatingAccount
          : isCreatingAccount // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      obscureText: null == obscureText
          ? _value.obscureText
          : obscureText // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggingIn: null == isLoggingIn
          ? _value.isLoggingIn
          : isLoggingIn // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$LoginStateImpl implements _LoginState {
  _$LoginStateImpl(
      {this.isCreatingAccount = false,
      this.errorMessage = '',
      this.obscureText = true,
      this.isLoggingIn = false,
      this.status = Status.loading});

  @override
  @JsonKey()
  final bool isCreatingAccount;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final bool obscureText;
  @override
  @JsonKey()
  final bool isLoggingIn;
  @override
  @JsonKey()
  final Status status;

  @override
  String toString() {
    return 'LoginState(isCreatingAccount: $isCreatingAccount, errorMessage: $errorMessage, obscureText: $obscureText, isLoggingIn: $isLoggingIn, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.isCreatingAccount, isCreatingAccount) ||
                other.isCreatingAccount == isCreatingAccount) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.obscureText, obscureText) ||
                other.obscureText == obscureText) &&
            (identical(other.isLoggingIn, isLoggingIn) ||
                other.isLoggingIn == isLoggingIn) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isCreatingAccount, errorMessage,
      obscureText, isLoggingIn, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  factory _LoginState(
      {final bool isCreatingAccount,
      final String errorMessage,
      final bool obscureText,
      final bool isLoggingIn,
      final Status status}) = _$LoginStateImpl;

  @override
  bool get isCreatingAccount;
  @override
  String get errorMessage;
  @override
  bool get obscureText;
  @override
  bool get isLoggingIn;
  @override
  Status get status;
  @override
  @JsonKey(ignore: true)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

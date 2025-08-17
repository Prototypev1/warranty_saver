// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginPageState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginPageState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginPageState()';
}


}

/// @nodoc
class $LoginPageStateCopyWith<$Res>  {
$LoginPageStateCopyWith(LoginPageState _, $Res Function(LoginPageState) __);
}


/// Adds pattern-matching-related methods to [LoginPageState].
extension LoginPageStatePatterns on LoginPageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoginPageStateInitial value)?  initial,TResult Function( LoginPageStateLoading value)?  loading,TResult Function( LoginPageStateSuccess value)?  success,TResult Function( LoginPageStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoginPageStateInitial() when initial != null:
return initial(_that);case LoginPageStateLoading() when loading != null:
return loading(_that);case LoginPageStateSuccess() when success != null:
return success(_that);case LoginPageStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoginPageStateInitial value)  initial,required TResult Function( LoginPageStateLoading value)  loading,required TResult Function( LoginPageStateSuccess value)  success,required TResult Function( LoginPageStateError value)  error,}){
final _that = this;
switch (_that) {
case LoginPageStateInitial():
return initial(_that);case LoginPageStateLoading():
return loading(_that);case LoginPageStateSuccess():
return success(_that);case LoginPageStateError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoginPageStateInitial value)?  initial,TResult? Function( LoginPageStateLoading value)?  loading,TResult? Function( LoginPageStateSuccess value)?  success,TResult? Function( LoginPageStateError value)?  error,}){
final _that = this;
switch (_that) {
case LoginPageStateInitial() when initial != null:
return initial(_that);case LoginPageStateLoading() when loading != null:
return loading(_that);case LoginPageStateSuccess() when success != null:
return success(_that);case LoginPageStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoginPageStateInitial() when initial != null:
return initial();case LoginPageStateLoading() when loading != null:
return loading();case LoginPageStateSuccess() when success != null:
return success();case LoginPageStateError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case LoginPageStateInitial():
return initial();case LoginPageStateLoading():
return loading();case LoginPageStateSuccess():
return success();case LoginPageStateError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case LoginPageStateInitial() when initial != null:
return initial();case LoginPageStateLoading() when loading != null:
return loading();case LoginPageStateSuccess() when success != null:
return success();case LoginPageStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class LoginPageStateInitial implements LoginPageState {
  const LoginPageStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginPageStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginPageState.initial()';
}


}




/// @nodoc


class LoginPageStateLoading implements LoginPageState {
  const LoginPageStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginPageStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginPageState.loading()';
}


}




/// @nodoc


class LoginPageStateSuccess implements LoginPageState {
  const LoginPageStateSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginPageStateSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginPageState.success()';
}


}




/// @nodoc


class LoginPageStateError implements LoginPageState {
  const LoginPageStateError({required this.message});
  

 final  String message;

/// Create a copy of LoginPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginPageStateErrorCopyWith<LoginPageStateError> get copyWith => _$LoginPageStateErrorCopyWithImpl<LoginPageStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginPageStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LoginPageState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $LoginPageStateErrorCopyWith<$Res> implements $LoginPageStateCopyWith<$Res> {
  factory $LoginPageStateErrorCopyWith(LoginPageStateError value, $Res Function(LoginPageStateError) _then) = _$LoginPageStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LoginPageStateErrorCopyWithImpl<$Res>
    implements $LoginPageStateErrorCopyWith<$Res> {
  _$LoginPageStateErrorCopyWithImpl(this._self, this._then);

  final LoginPageStateError _self;
  final $Res Function(LoginPageStateError) _then;

/// Create a copy of LoginPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LoginPageStateError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterPageState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterPageState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterPageState()';
}


}

/// @nodoc
class $RegisterPageStateCopyWith<$Res>  {
$RegisterPageStateCopyWith(RegisterPageState _, $Res Function(RegisterPageState) __);
}


/// Adds pattern-matching-related methods to [RegisterPageState].
extension RegisterPageStatePatterns on RegisterPageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RegisterPageStateInitial value)?  initial,TResult Function( RegisterPageStateLoading value)?  loading,TResult Function( RegisterPageStateSuccess value)?  success,TResult Function( RegisterPageStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RegisterPageStateInitial() when initial != null:
return initial(_that);case RegisterPageStateLoading() when loading != null:
return loading(_that);case RegisterPageStateSuccess() when success != null:
return success(_that);case RegisterPageStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RegisterPageStateInitial value)  initial,required TResult Function( RegisterPageStateLoading value)  loading,required TResult Function( RegisterPageStateSuccess value)  success,required TResult Function( RegisterPageStateError value)  error,}){
final _that = this;
switch (_that) {
case RegisterPageStateInitial():
return initial(_that);case RegisterPageStateLoading():
return loading(_that);case RegisterPageStateSuccess():
return success(_that);case RegisterPageStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RegisterPageStateInitial value)?  initial,TResult? Function( RegisterPageStateLoading value)?  loading,TResult? Function( RegisterPageStateSuccess value)?  success,TResult? Function( RegisterPageStateError value)?  error,}){
final _that = this;
switch (_that) {
case RegisterPageStateInitial() when initial != null:
return initial(_that);case RegisterPageStateLoading() when loading != null:
return loading(_that);case RegisterPageStateSuccess() when success != null:
return success(_that);case RegisterPageStateError() when error != null:
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
case RegisterPageStateInitial() when initial != null:
return initial();case RegisterPageStateLoading() when loading != null:
return loading();case RegisterPageStateSuccess() when success != null:
return success();case RegisterPageStateError() when error != null:
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
case RegisterPageStateInitial():
return initial();case RegisterPageStateLoading():
return loading();case RegisterPageStateSuccess():
return success();case RegisterPageStateError():
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
case RegisterPageStateInitial() when initial != null:
return initial();case RegisterPageStateLoading() when loading != null:
return loading();case RegisterPageStateSuccess() when success != null:
return success();case RegisterPageStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class RegisterPageStateInitial implements RegisterPageState {
  const RegisterPageStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterPageStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterPageState.initial()';
}


}




/// @nodoc


class RegisterPageStateLoading implements RegisterPageState {
  const RegisterPageStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterPageStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterPageState.loading()';
}


}




/// @nodoc


class RegisterPageStateSuccess implements RegisterPageState {
  const RegisterPageStateSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterPageStateSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterPageState.success()';
}


}




/// @nodoc


class RegisterPageStateError implements RegisterPageState {
  const RegisterPageStateError({required this.message});
  

 final  String message;

/// Create a copy of RegisterPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterPageStateErrorCopyWith<RegisterPageStateError> get copyWith => _$RegisterPageStateErrorCopyWithImpl<RegisterPageStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterPageStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'RegisterPageState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $RegisterPageStateErrorCopyWith<$Res> implements $RegisterPageStateCopyWith<$Res> {
  factory $RegisterPageStateErrorCopyWith(RegisterPageStateError value, $Res Function(RegisterPageStateError) _then) = _$RegisterPageStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$RegisterPageStateErrorCopyWithImpl<$Res>
    implements $RegisterPageStateErrorCopyWith<$Res> {
  _$RegisterPageStateErrorCopyWithImpl(this._self, this._then);

  final RegisterPageStateError _self;
  final $Res Function(RegisterPageStateError) _then;

/// Create a copy of RegisterPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(RegisterPageStateError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

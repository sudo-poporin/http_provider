// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NetworkException {

 dynamic get error;
/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkExceptionCopyWith<NetworkException> get copyWith => _$NetworkExceptionCopyWithImpl<NetworkException>(this as NetworkException, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkException&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'NetworkException(error: $error)';
}


}

/// @nodoc
abstract mixin class $NetworkExceptionCopyWith<$Res>  {
  factory $NetworkExceptionCopyWith(NetworkException value, $Res Function(NetworkException) _then) = _$NetworkExceptionCopyWithImpl;
@useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class _$NetworkExceptionCopyWithImpl<$Res>
    implements $NetworkExceptionCopyWith<$Res> {
  _$NetworkExceptionCopyWithImpl(this._self, this._then);

  final NetworkException _self;
  final $Res Function(NetworkException) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? error = freezed,}) {
  return _then(_self.copyWith(
error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [NetworkException].
extension NetworkExceptionPatterns on NetworkException {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RequestCancelled value)?  requestCancelled,TResult Function( UnauthorisedRequest value)?  unauthorized,TResult Function( BadRequest value)?  badRequest,TResult Function( BadCertificate value)?  badCertificate,TResult Function( Forbidden value)?  forbidden,TResult Function( NotFound value)?  notFound,TResult Function( MethodNotAllowed value)?  methodNotAllowed,TResult Function( NotAcceptable value)?  notAcceptable,TResult Function( ReceiveTimeout value)?  receiveTimeout,TResult Function( RequestTimeout value)?  requestTimeout,TResult Function( SendTimeout value)?  sendTimeout,TResult Function( ConnectionTimeout value)?  connectionTimeout,TResult Function( Conflict value)?  conflict,TResult Function( InternalServerError value)?  internalServerError,TResult Function( NotImplemented value)?  notImplemented,TResult Function( ServiceUnavailable value)?  serviceUnavailable,TResult Function( NoInternetConnection value)?  noInternetConnection,TResult Function( FormatException value)?  formatException,TResult Function( UnableToProcess value)?  unableToProcess,TResult Function( DefaultError value)?  defaultError,TResult Function( UnexpectedError value)?  unexpectedError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RequestCancelled() when requestCancelled != null:
return requestCancelled(_that);case UnauthorisedRequest() when unauthorized != null:
return unauthorized(_that);case BadRequest() when badRequest != null:
return badRequest(_that);case BadCertificate() when badCertificate != null:
return badCertificate(_that);case Forbidden() when forbidden != null:
return forbidden(_that);case NotFound() when notFound != null:
return notFound(_that);case MethodNotAllowed() when methodNotAllowed != null:
return methodNotAllowed(_that);case NotAcceptable() when notAcceptable != null:
return notAcceptable(_that);case ReceiveTimeout() when receiveTimeout != null:
return receiveTimeout(_that);case RequestTimeout() when requestTimeout != null:
return requestTimeout(_that);case SendTimeout() when sendTimeout != null:
return sendTimeout(_that);case ConnectionTimeout() when connectionTimeout != null:
return connectionTimeout(_that);case Conflict() when conflict != null:
return conflict(_that);case InternalServerError() when internalServerError != null:
return internalServerError(_that);case NotImplemented() when notImplemented != null:
return notImplemented(_that);case ServiceUnavailable() when serviceUnavailable != null:
return serviceUnavailable(_that);case NoInternetConnection() when noInternetConnection != null:
return noInternetConnection(_that);case FormatException() when formatException != null:
return formatException(_that);case UnableToProcess() when unableToProcess != null:
return unableToProcess(_that);case DefaultError() when defaultError != null:
return defaultError(_that);case UnexpectedError() when unexpectedError != null:
return unexpectedError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RequestCancelled value)  requestCancelled,required TResult Function( UnauthorisedRequest value)  unauthorized,required TResult Function( BadRequest value)  badRequest,required TResult Function( BadCertificate value)  badCertificate,required TResult Function( Forbidden value)  forbidden,required TResult Function( NotFound value)  notFound,required TResult Function( MethodNotAllowed value)  methodNotAllowed,required TResult Function( NotAcceptable value)  notAcceptable,required TResult Function( ReceiveTimeout value)  receiveTimeout,required TResult Function( RequestTimeout value)  requestTimeout,required TResult Function( SendTimeout value)  sendTimeout,required TResult Function( ConnectionTimeout value)  connectionTimeout,required TResult Function( Conflict value)  conflict,required TResult Function( InternalServerError value)  internalServerError,required TResult Function( NotImplemented value)  notImplemented,required TResult Function( ServiceUnavailable value)  serviceUnavailable,required TResult Function( NoInternetConnection value)  noInternetConnection,required TResult Function( FormatException value)  formatException,required TResult Function( UnableToProcess value)  unableToProcess,required TResult Function( DefaultError value)  defaultError,required TResult Function( UnexpectedError value)  unexpectedError,}){
final _that = this;
switch (_that) {
case RequestCancelled():
return requestCancelled(_that);case UnauthorisedRequest():
return unauthorized(_that);case BadRequest():
return badRequest(_that);case BadCertificate():
return badCertificate(_that);case Forbidden():
return forbidden(_that);case NotFound():
return notFound(_that);case MethodNotAllowed():
return methodNotAllowed(_that);case NotAcceptable():
return notAcceptable(_that);case ReceiveTimeout():
return receiveTimeout(_that);case RequestTimeout():
return requestTimeout(_that);case SendTimeout():
return sendTimeout(_that);case ConnectionTimeout():
return connectionTimeout(_that);case Conflict():
return conflict(_that);case InternalServerError():
return internalServerError(_that);case NotImplemented():
return notImplemented(_that);case ServiceUnavailable():
return serviceUnavailable(_that);case NoInternetConnection():
return noInternetConnection(_that);case FormatException():
return formatException(_that);case UnableToProcess():
return unableToProcess(_that);case DefaultError():
return defaultError(_that);case UnexpectedError():
return unexpectedError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RequestCancelled value)?  requestCancelled,TResult? Function( UnauthorisedRequest value)?  unauthorized,TResult? Function( BadRequest value)?  badRequest,TResult? Function( BadCertificate value)?  badCertificate,TResult? Function( Forbidden value)?  forbidden,TResult? Function( NotFound value)?  notFound,TResult? Function( MethodNotAllowed value)?  methodNotAllowed,TResult? Function( NotAcceptable value)?  notAcceptable,TResult? Function( ReceiveTimeout value)?  receiveTimeout,TResult? Function( RequestTimeout value)?  requestTimeout,TResult? Function( SendTimeout value)?  sendTimeout,TResult? Function( ConnectionTimeout value)?  connectionTimeout,TResult? Function( Conflict value)?  conflict,TResult? Function( InternalServerError value)?  internalServerError,TResult? Function( NotImplemented value)?  notImplemented,TResult? Function( ServiceUnavailable value)?  serviceUnavailable,TResult? Function( NoInternetConnection value)?  noInternetConnection,TResult? Function( FormatException value)?  formatException,TResult? Function( UnableToProcess value)?  unableToProcess,TResult? Function( DefaultError value)?  defaultError,TResult? Function( UnexpectedError value)?  unexpectedError,}){
final _that = this;
switch (_that) {
case RequestCancelled() when requestCancelled != null:
return requestCancelled(_that);case UnauthorisedRequest() when unauthorized != null:
return unauthorized(_that);case BadRequest() when badRequest != null:
return badRequest(_that);case BadCertificate() when badCertificate != null:
return badCertificate(_that);case Forbidden() when forbidden != null:
return forbidden(_that);case NotFound() when notFound != null:
return notFound(_that);case MethodNotAllowed() when methodNotAllowed != null:
return methodNotAllowed(_that);case NotAcceptable() when notAcceptable != null:
return notAcceptable(_that);case ReceiveTimeout() when receiveTimeout != null:
return receiveTimeout(_that);case RequestTimeout() when requestTimeout != null:
return requestTimeout(_that);case SendTimeout() when sendTimeout != null:
return sendTimeout(_that);case ConnectionTimeout() when connectionTimeout != null:
return connectionTimeout(_that);case Conflict() when conflict != null:
return conflict(_that);case InternalServerError() when internalServerError != null:
return internalServerError(_that);case NotImplemented() when notImplemented != null:
return notImplemented(_that);case ServiceUnavailable() when serviceUnavailable != null:
return serviceUnavailable(_that);case NoInternetConnection() when noInternetConnection != null:
return noInternetConnection(_that);case FormatException() when formatException != null:
return formatException(_that);case UnableToProcess() when unableToProcess != null:
return unableToProcess(_that);case DefaultError() when defaultError != null:
return defaultError(_that);case UnexpectedError() when unexpectedError != null:
return unexpectedError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( dynamic error)?  requestCancelled,TResult Function( dynamic error)?  unauthorized,TResult Function( dynamic error)?  badRequest,TResult Function( dynamic error)?  badCertificate,TResult Function( dynamic error)?  forbidden,TResult Function( dynamic error)?  notFound,TResult Function( dynamic error)?  methodNotAllowed,TResult Function( dynamic error)?  notAcceptable,TResult Function( dynamic error)?  receiveTimeout,TResult Function( dynamic error)?  requestTimeout,TResult Function( dynamic error)?  sendTimeout,TResult Function( dynamic error)?  connectionTimeout,TResult Function( dynamic error)?  conflict,TResult Function( dynamic error)?  internalServerError,TResult Function( dynamic error)?  notImplemented,TResult Function( dynamic error)?  serviceUnavailable,TResult Function( dynamic error)?  noInternetConnection,TResult Function( dynamic error)?  formatException,TResult Function( dynamic error)?  unableToProcess,TResult Function( dynamic error)?  defaultError,TResult Function( dynamic error)?  unexpectedError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RequestCancelled() when requestCancelled != null:
return requestCancelled(_that.error);case UnauthorisedRequest() when unauthorized != null:
return unauthorized(_that.error);case BadRequest() when badRequest != null:
return badRequest(_that.error);case BadCertificate() when badCertificate != null:
return badCertificate(_that.error);case Forbidden() when forbidden != null:
return forbidden(_that.error);case NotFound() when notFound != null:
return notFound(_that.error);case MethodNotAllowed() when methodNotAllowed != null:
return methodNotAllowed(_that.error);case NotAcceptable() when notAcceptable != null:
return notAcceptable(_that.error);case ReceiveTimeout() when receiveTimeout != null:
return receiveTimeout(_that.error);case RequestTimeout() when requestTimeout != null:
return requestTimeout(_that.error);case SendTimeout() when sendTimeout != null:
return sendTimeout(_that.error);case ConnectionTimeout() when connectionTimeout != null:
return connectionTimeout(_that.error);case Conflict() when conflict != null:
return conflict(_that.error);case InternalServerError() when internalServerError != null:
return internalServerError(_that.error);case NotImplemented() when notImplemented != null:
return notImplemented(_that.error);case ServiceUnavailable() when serviceUnavailable != null:
return serviceUnavailable(_that.error);case NoInternetConnection() when noInternetConnection != null:
return noInternetConnection(_that.error);case FormatException() when formatException != null:
return formatException(_that.error);case UnableToProcess() when unableToProcess != null:
return unableToProcess(_that.error);case DefaultError() when defaultError != null:
return defaultError(_that.error);case UnexpectedError() when unexpectedError != null:
return unexpectedError(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( dynamic error)  requestCancelled,required TResult Function( dynamic error)  unauthorized,required TResult Function( dynamic error)  badRequest,required TResult Function( dynamic error)  badCertificate,required TResult Function( dynamic error)  forbidden,required TResult Function( dynamic error)  notFound,required TResult Function( dynamic error)  methodNotAllowed,required TResult Function( dynamic error)  notAcceptable,required TResult Function( dynamic error)  receiveTimeout,required TResult Function( dynamic error)  requestTimeout,required TResult Function( dynamic error)  sendTimeout,required TResult Function( dynamic error)  connectionTimeout,required TResult Function( dynamic error)  conflict,required TResult Function( dynamic error)  internalServerError,required TResult Function( dynamic error)  notImplemented,required TResult Function( dynamic error)  serviceUnavailable,required TResult Function( dynamic error)  noInternetConnection,required TResult Function( dynamic error)  formatException,required TResult Function( dynamic error)  unableToProcess,required TResult Function( dynamic error)  defaultError,required TResult Function( dynamic error)  unexpectedError,}) {final _that = this;
switch (_that) {
case RequestCancelled():
return requestCancelled(_that.error);case UnauthorisedRequest():
return unauthorized(_that.error);case BadRequest():
return badRequest(_that.error);case BadCertificate():
return badCertificate(_that.error);case Forbidden():
return forbidden(_that.error);case NotFound():
return notFound(_that.error);case MethodNotAllowed():
return methodNotAllowed(_that.error);case NotAcceptable():
return notAcceptable(_that.error);case ReceiveTimeout():
return receiveTimeout(_that.error);case RequestTimeout():
return requestTimeout(_that.error);case SendTimeout():
return sendTimeout(_that.error);case ConnectionTimeout():
return connectionTimeout(_that.error);case Conflict():
return conflict(_that.error);case InternalServerError():
return internalServerError(_that.error);case NotImplemented():
return notImplemented(_that.error);case ServiceUnavailable():
return serviceUnavailable(_that.error);case NoInternetConnection():
return noInternetConnection(_that.error);case FormatException():
return formatException(_that.error);case UnableToProcess():
return unableToProcess(_that.error);case DefaultError():
return defaultError(_that.error);case UnexpectedError():
return unexpectedError(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( dynamic error)?  requestCancelled,TResult? Function( dynamic error)?  unauthorized,TResult? Function( dynamic error)?  badRequest,TResult? Function( dynamic error)?  badCertificate,TResult? Function( dynamic error)?  forbidden,TResult? Function( dynamic error)?  notFound,TResult? Function( dynamic error)?  methodNotAllowed,TResult? Function( dynamic error)?  notAcceptable,TResult? Function( dynamic error)?  receiveTimeout,TResult? Function( dynamic error)?  requestTimeout,TResult? Function( dynamic error)?  sendTimeout,TResult? Function( dynamic error)?  connectionTimeout,TResult? Function( dynamic error)?  conflict,TResult? Function( dynamic error)?  internalServerError,TResult? Function( dynamic error)?  notImplemented,TResult? Function( dynamic error)?  serviceUnavailable,TResult? Function( dynamic error)?  noInternetConnection,TResult? Function( dynamic error)?  formatException,TResult? Function( dynamic error)?  unableToProcess,TResult? Function( dynamic error)?  defaultError,TResult? Function( dynamic error)?  unexpectedError,}) {final _that = this;
switch (_that) {
case RequestCancelled() when requestCancelled != null:
return requestCancelled(_that.error);case UnauthorisedRequest() when unauthorized != null:
return unauthorized(_that.error);case BadRequest() when badRequest != null:
return badRequest(_that.error);case BadCertificate() when badCertificate != null:
return badCertificate(_that.error);case Forbidden() when forbidden != null:
return forbidden(_that.error);case NotFound() when notFound != null:
return notFound(_that.error);case MethodNotAllowed() when methodNotAllowed != null:
return methodNotAllowed(_that.error);case NotAcceptable() when notAcceptable != null:
return notAcceptable(_that.error);case ReceiveTimeout() when receiveTimeout != null:
return receiveTimeout(_that.error);case RequestTimeout() when requestTimeout != null:
return requestTimeout(_that.error);case SendTimeout() when sendTimeout != null:
return sendTimeout(_that.error);case ConnectionTimeout() when connectionTimeout != null:
return connectionTimeout(_that.error);case Conflict() when conflict != null:
return conflict(_that.error);case InternalServerError() when internalServerError != null:
return internalServerError(_that.error);case NotImplemented() when notImplemented != null:
return notImplemented(_that.error);case ServiceUnavailable() when serviceUnavailable != null:
return serviceUnavailable(_that.error);case NoInternetConnection() when noInternetConnection != null:
return noInternetConnection(_that.error);case FormatException() when formatException != null:
return formatException(_that.error);case UnableToProcess() when unableToProcess != null:
return unableToProcess(_that.error);case DefaultError() when defaultError != null:
return defaultError(_that.error);case UnexpectedError() when unexpectedError != null:
return unexpectedError(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class RequestCancelled implements NetworkException {
  const RequestCancelled([this.error]);
  

@override final  dynamic error;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestCancelledCopyWith<RequestCancelled> get copyWith => _$RequestCancelledCopyWithImpl<RequestCancelled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestCancelled&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'NetworkException.requestCancelled(error: $error)';
}


}

/// @nodoc
abstract mixin class $RequestCancelledCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory $RequestCancelledCopyWith(RequestCancelled value, $Res Function(RequestCancelled) _then) = _$RequestCancelledCopyWithImpl;
@override @useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class _$RequestCancelledCopyWithImpl<$Res>
    implements $RequestCancelledCopyWith<$Res> {
  _$RequestCancelledCopyWithImpl(this._self, this._then);

  final RequestCancelled _self;
  final $Res Function(RequestCancelled) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(RequestCancelled(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class UnauthorisedRequest implements NetworkException {
  const UnauthorisedRequest([this.error]);
  

@override final  dynamic error;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnauthorisedRequestCopyWith<UnauthorisedRequest> get copyWith => _$UnauthorisedRequestCopyWithImpl<UnauthorisedRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnauthorisedRequest&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'NetworkException.unauthorized(error: $error)';
}


}

/// @nodoc
abstract mixin class $UnauthorisedRequestCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory $UnauthorisedRequestCopyWith(UnauthorisedRequest value, $Res Function(UnauthorisedRequest) _then) = _$UnauthorisedRequestCopyWithImpl;
@override @useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class _$UnauthorisedRequestCopyWithImpl<$Res>
    implements $UnauthorisedRequestCopyWith<$Res> {
  _$UnauthorisedRequestCopyWithImpl(this._self, this._then);

  final UnauthorisedRequest _self;
  final $Res Function(UnauthorisedRequest) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(UnauthorisedRequest(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class BadRequest implements NetworkException {
  const BadRequest([this.error]);
  

@override final  dynamic error;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BadRequestCopyWith<BadRequest> get copyWith => _$BadRequestCopyWithImpl<BadRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BadRequest&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'NetworkException.badRequest(error: $error)';
}


}

/// @nodoc
abstract mixin class $BadRequestCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory $BadRequestCopyWith(BadRequest value, $Res Function(BadRequest) _then) = _$BadRequestCopyWithImpl;
@override @useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class _$BadRequestCopyWithImpl<$Res>
    implements $BadRequestCopyWith<$Res> {
  _$BadRequestCopyWithImpl(this._self, this._then);

  final BadRequest _self;
  final $Res Function(BadRequest) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(BadRequest(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class BadCertificate implements NetworkException {
  const BadCertificate([this.error]);
  

@override final  dynamic error;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BadCertificateCopyWith<BadCertificate> get copyWith => _$BadCertificateCopyWithImpl<BadCertificate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BadCertificate&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'NetworkException.badCertificate(error: $error)';
}


}

/// @nodoc
abstract mixin class $BadCertificateCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory $BadCertificateCopyWith(BadCertificate value, $Res Function(BadCertificate) _then) = _$BadCertificateCopyWithImpl;
@override @useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class _$BadCertificateCopyWithImpl<$Res>
    implements $BadCertificateCopyWith<$Res> {
  _$BadCertificateCopyWithImpl(this._self, this._then);

  final BadCertificate _self;
  final $Res Function(BadCertificate) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(BadCertificate(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class Forbidden implements NetworkException {
  const Forbidden([this.error]);
  

@override final  dynamic error;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForbiddenCopyWith<Forbidden> get copyWith => _$ForbiddenCopyWithImpl<Forbidden>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Forbidden&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'NetworkException.forbidden(error: $error)';
}


}

/// @nodoc
abstract mixin class $ForbiddenCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory $ForbiddenCopyWith(Forbidden value, $Res Function(Forbidden) _then) = _$ForbiddenCopyWithImpl;
@override @useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class _$ForbiddenCopyWithImpl<$Res>
    implements $ForbiddenCopyWith<$Res> {
  _$ForbiddenCopyWithImpl(this._self, this._then);

  final Forbidden _self;
  final $Res Function(Forbidden) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(Forbidden(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class NotFound implements NetworkException {
  const NotFound([this.error]);
  

@override final  dynamic error;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotFoundCopyWith<NotFound> get copyWith => _$NotFoundCopyWithImpl<NotFound>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotFound&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'NetworkException.notFound(error: $error)';
}


}

/// @nodoc
abstract mixin class $NotFoundCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory $NotFoundCopyWith(NotFound value, $Res Function(NotFound) _then) = _$NotFoundCopyWithImpl;
@override @useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class _$NotFoundCopyWithImpl<$Res>
    implements $NotFoundCopyWith<$Res> {
  _$NotFoundCopyWithImpl(this._self, this._then);

  final NotFound _self;
  final $Res Function(NotFound) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(NotFound(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class MethodNotAllowed implements NetworkException {
  const MethodNotAllowed([this.error]);
  

@override final  dynamic error;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MethodNotAllowedCopyWith<MethodNotAllowed> get copyWith => _$MethodNotAllowedCopyWithImpl<MethodNotAllowed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MethodNotAllowed&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'NetworkException.methodNotAllowed(error: $error)';
}


}

/// @nodoc
abstract mixin class $MethodNotAllowedCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory $MethodNotAllowedCopyWith(MethodNotAllowed value, $Res Function(MethodNotAllowed) _then) = _$MethodNotAllowedCopyWithImpl;
@override @useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class _$MethodNotAllowedCopyWithImpl<$Res>
    implements $MethodNotAllowedCopyWith<$Res> {
  _$MethodNotAllowedCopyWithImpl(this._self, this._then);

  final MethodNotAllowed _self;
  final $Res Function(MethodNotAllowed) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(MethodNotAllowed(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class NotAcceptable implements NetworkException {
  const NotAcceptable([this.error]);
  

@override final  dynamic error;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotAcceptableCopyWith<NotAcceptable> get copyWith => _$NotAcceptableCopyWithImpl<NotAcceptable>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotAcceptable&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'NetworkException.notAcceptable(error: $error)';
}


}

/// @nodoc
abstract mixin class $NotAcceptableCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory $NotAcceptableCopyWith(NotAcceptable value, $Res Function(NotAcceptable) _then) = _$NotAcceptableCopyWithImpl;
@override @useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class _$NotAcceptableCopyWithImpl<$Res>
    implements $NotAcceptableCopyWith<$Res> {
  _$NotAcceptableCopyWithImpl(this._self, this._then);

  final NotAcceptable _self;
  final $Res Function(NotAcceptable) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(NotAcceptable(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class ReceiveTimeout implements NetworkException {
  const ReceiveTimeout([this.error]);
  

@override final  dynamic error;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiveTimeoutCopyWith<ReceiveTimeout> get copyWith => _$ReceiveTimeoutCopyWithImpl<ReceiveTimeout>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiveTimeout&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'NetworkException.receiveTimeout(error: $error)';
}


}

/// @nodoc
abstract mixin class $ReceiveTimeoutCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory $ReceiveTimeoutCopyWith(ReceiveTimeout value, $Res Function(ReceiveTimeout) _then) = _$ReceiveTimeoutCopyWithImpl;
@override @useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class _$ReceiveTimeoutCopyWithImpl<$Res>
    implements $ReceiveTimeoutCopyWith<$Res> {
  _$ReceiveTimeoutCopyWithImpl(this._self, this._then);

  final ReceiveTimeout _self;
  final $Res Function(ReceiveTimeout) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(ReceiveTimeout(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class RequestTimeout implements NetworkException {
  const RequestTimeout([this.error]);
  

@override final  dynamic error;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestTimeoutCopyWith<RequestTimeout> get copyWith => _$RequestTimeoutCopyWithImpl<RequestTimeout>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestTimeout&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'NetworkException.requestTimeout(error: $error)';
}


}

/// @nodoc
abstract mixin class $RequestTimeoutCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory $RequestTimeoutCopyWith(RequestTimeout value, $Res Function(RequestTimeout) _then) = _$RequestTimeoutCopyWithImpl;
@override @useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class _$RequestTimeoutCopyWithImpl<$Res>
    implements $RequestTimeoutCopyWith<$Res> {
  _$RequestTimeoutCopyWithImpl(this._self, this._then);

  final RequestTimeout _self;
  final $Res Function(RequestTimeout) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(RequestTimeout(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class SendTimeout implements NetworkException {
  const SendTimeout([this.error]);
  

@override final  dynamic error;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendTimeoutCopyWith<SendTimeout> get copyWith => _$SendTimeoutCopyWithImpl<SendTimeout>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendTimeout&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'NetworkException.sendTimeout(error: $error)';
}


}

/// @nodoc
abstract mixin class $SendTimeoutCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory $SendTimeoutCopyWith(SendTimeout value, $Res Function(SendTimeout) _then) = _$SendTimeoutCopyWithImpl;
@override @useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class _$SendTimeoutCopyWithImpl<$Res>
    implements $SendTimeoutCopyWith<$Res> {
  _$SendTimeoutCopyWithImpl(this._self, this._then);

  final SendTimeout _self;
  final $Res Function(SendTimeout) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(SendTimeout(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class ConnectionTimeout implements NetworkException {
  const ConnectionTimeout([this.error]);
  

@override final  dynamic error;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionTimeoutCopyWith<ConnectionTimeout> get copyWith => _$ConnectionTimeoutCopyWithImpl<ConnectionTimeout>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionTimeout&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'NetworkException.connectionTimeout(error: $error)';
}


}

/// @nodoc
abstract mixin class $ConnectionTimeoutCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory $ConnectionTimeoutCopyWith(ConnectionTimeout value, $Res Function(ConnectionTimeout) _then) = _$ConnectionTimeoutCopyWithImpl;
@override @useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class _$ConnectionTimeoutCopyWithImpl<$Res>
    implements $ConnectionTimeoutCopyWith<$Res> {
  _$ConnectionTimeoutCopyWithImpl(this._self, this._then);

  final ConnectionTimeout _self;
  final $Res Function(ConnectionTimeout) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(ConnectionTimeout(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class Conflict implements NetworkException {
  const Conflict([this.error]);
  

@override final  dynamic error;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConflictCopyWith<Conflict> get copyWith => _$ConflictCopyWithImpl<Conflict>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Conflict&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'NetworkException.conflict(error: $error)';
}


}

/// @nodoc
abstract mixin class $ConflictCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory $ConflictCopyWith(Conflict value, $Res Function(Conflict) _then) = _$ConflictCopyWithImpl;
@override @useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class _$ConflictCopyWithImpl<$Res>
    implements $ConflictCopyWith<$Res> {
  _$ConflictCopyWithImpl(this._self, this._then);

  final Conflict _self;
  final $Res Function(Conflict) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(Conflict(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class InternalServerError implements NetworkException {
  const InternalServerError([this.error]);
  

@override final  dynamic error;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InternalServerErrorCopyWith<InternalServerError> get copyWith => _$InternalServerErrorCopyWithImpl<InternalServerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InternalServerError&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'NetworkException.internalServerError(error: $error)';
}


}

/// @nodoc
abstract mixin class $InternalServerErrorCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory $InternalServerErrorCopyWith(InternalServerError value, $Res Function(InternalServerError) _then) = _$InternalServerErrorCopyWithImpl;
@override @useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class _$InternalServerErrorCopyWithImpl<$Res>
    implements $InternalServerErrorCopyWith<$Res> {
  _$InternalServerErrorCopyWithImpl(this._self, this._then);

  final InternalServerError _self;
  final $Res Function(InternalServerError) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(InternalServerError(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class NotImplemented implements NetworkException {
  const NotImplemented([this.error]);
  

@override final  dynamic error;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotImplementedCopyWith<NotImplemented> get copyWith => _$NotImplementedCopyWithImpl<NotImplemented>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotImplemented&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'NetworkException.notImplemented(error: $error)';
}


}

/// @nodoc
abstract mixin class $NotImplementedCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory $NotImplementedCopyWith(NotImplemented value, $Res Function(NotImplemented) _then) = _$NotImplementedCopyWithImpl;
@override @useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class _$NotImplementedCopyWithImpl<$Res>
    implements $NotImplementedCopyWith<$Res> {
  _$NotImplementedCopyWithImpl(this._self, this._then);

  final NotImplemented _self;
  final $Res Function(NotImplemented) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(NotImplemented(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class ServiceUnavailable implements NetworkException {
  const ServiceUnavailable([this.error]);
  

@override final  dynamic error;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceUnavailableCopyWith<ServiceUnavailable> get copyWith => _$ServiceUnavailableCopyWithImpl<ServiceUnavailable>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceUnavailable&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'NetworkException.serviceUnavailable(error: $error)';
}


}

/// @nodoc
abstract mixin class $ServiceUnavailableCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory $ServiceUnavailableCopyWith(ServiceUnavailable value, $Res Function(ServiceUnavailable) _then) = _$ServiceUnavailableCopyWithImpl;
@override @useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class _$ServiceUnavailableCopyWithImpl<$Res>
    implements $ServiceUnavailableCopyWith<$Res> {
  _$ServiceUnavailableCopyWithImpl(this._self, this._then);

  final ServiceUnavailable _self;
  final $Res Function(ServiceUnavailable) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(ServiceUnavailable(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class NoInternetConnection implements NetworkException {
  const NoInternetConnection([this.error]);
  

@override final  dynamic error;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoInternetConnectionCopyWith<NoInternetConnection> get copyWith => _$NoInternetConnectionCopyWithImpl<NoInternetConnection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoInternetConnection&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'NetworkException.noInternetConnection(error: $error)';
}


}

/// @nodoc
abstract mixin class $NoInternetConnectionCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory $NoInternetConnectionCopyWith(NoInternetConnection value, $Res Function(NoInternetConnection) _then) = _$NoInternetConnectionCopyWithImpl;
@override @useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class _$NoInternetConnectionCopyWithImpl<$Res>
    implements $NoInternetConnectionCopyWith<$Res> {
  _$NoInternetConnectionCopyWithImpl(this._self, this._then);

  final NoInternetConnection _self;
  final $Res Function(NoInternetConnection) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(NoInternetConnection(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class FormatException implements NetworkException {
  const FormatException([this.error]);
  

@override final  dynamic error;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormatExceptionCopyWith<FormatException> get copyWith => _$FormatExceptionCopyWithImpl<FormatException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormatException&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'NetworkException.formatException(error: $error)';
}


}

/// @nodoc
abstract mixin class $FormatExceptionCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory $FormatExceptionCopyWith(FormatException value, $Res Function(FormatException) _then) = _$FormatExceptionCopyWithImpl;
@override @useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class _$FormatExceptionCopyWithImpl<$Res>
    implements $FormatExceptionCopyWith<$Res> {
  _$FormatExceptionCopyWithImpl(this._self, this._then);

  final FormatException _self;
  final $Res Function(FormatException) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(FormatException(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class UnableToProcess implements NetworkException {
  const UnableToProcess([this.error]);
  

@override final  dynamic error;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnableToProcessCopyWith<UnableToProcess> get copyWith => _$UnableToProcessCopyWithImpl<UnableToProcess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnableToProcess&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'NetworkException.unableToProcess(error: $error)';
}


}

/// @nodoc
abstract mixin class $UnableToProcessCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory $UnableToProcessCopyWith(UnableToProcess value, $Res Function(UnableToProcess) _then) = _$UnableToProcessCopyWithImpl;
@override @useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class _$UnableToProcessCopyWithImpl<$Res>
    implements $UnableToProcessCopyWith<$Res> {
  _$UnableToProcessCopyWithImpl(this._self, this._then);

  final UnableToProcess _self;
  final $Res Function(UnableToProcess) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(UnableToProcess(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class DefaultError implements NetworkException {
  const DefaultError([this.error]);
  

@override final  dynamic error;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DefaultErrorCopyWith<DefaultError> get copyWith => _$DefaultErrorCopyWithImpl<DefaultError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DefaultError&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'NetworkException.defaultError(error: $error)';
}


}

/// @nodoc
abstract mixin class $DefaultErrorCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory $DefaultErrorCopyWith(DefaultError value, $Res Function(DefaultError) _then) = _$DefaultErrorCopyWithImpl;
@override @useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class _$DefaultErrorCopyWithImpl<$Res>
    implements $DefaultErrorCopyWith<$Res> {
  _$DefaultErrorCopyWithImpl(this._self, this._then);

  final DefaultError _self;
  final $Res Function(DefaultError) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(DefaultError(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class UnexpectedError implements NetworkException {
  const UnexpectedError([this.error]);
  

@override final  dynamic error;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnexpectedErrorCopyWith<UnexpectedError> get copyWith => _$UnexpectedErrorCopyWithImpl<UnexpectedError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnexpectedError&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'NetworkException.unexpectedError(error: $error)';
}


}

/// @nodoc
abstract mixin class $UnexpectedErrorCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory $UnexpectedErrorCopyWith(UnexpectedError value, $Res Function(UnexpectedError) _then) = _$UnexpectedErrorCopyWithImpl;
@override @useResult
$Res call({
 dynamic error
});




}
/// @nodoc
class _$UnexpectedErrorCopyWithImpl<$Res>
    implements $UnexpectedErrorCopyWith<$Res> {
  _$UnexpectedErrorCopyWithImpl(this._self, this._then);

  final UnexpectedError _self;
  final $Res Function(UnexpectedError) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(UnexpectedError(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_edit_note_ui_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddEditNoteUiEvent<T> {
  T get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SaveNote<T> value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SaveNote<T> value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveNote<T> value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddEditNoteUiEventCopyWith<T, AddEditNoteUiEvent<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddEditNoteUiEventCopyWith<T, $Res> {
  factory $AddEditNoteUiEventCopyWith(AddEditNoteUiEvent<T> value,
          $Res Function(AddEditNoteUiEvent<T>) then) =
      _$AddEditNoteUiEventCopyWithImpl<T, $Res, AddEditNoteUiEvent<T>>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class _$AddEditNoteUiEventCopyWithImpl<T, $Res,
        $Val extends AddEditNoteUiEvent<T>>
    implements $AddEditNoteUiEventCopyWith<T, $Res> {
  _$AddEditNoteUiEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaveNoteCopyWith<T, $Res>
    implements $AddEditNoteUiEventCopyWith<T, $Res> {
  factory _$$SaveNoteCopyWith(
          _$SaveNote<T> value, $Res Function(_$SaveNote<T>) then) =
      __$$SaveNoteCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SaveNoteCopyWithImpl<T, $Res>
    extends _$AddEditNoteUiEventCopyWithImpl<T, $Res, _$SaveNote<T>>
    implements _$$SaveNoteCopyWith<T, $Res> {
  __$$SaveNoteCopyWithImpl(
      _$SaveNote<T> _value, $Res Function(_$SaveNote<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SaveNote<T>(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SaveNote<T> implements SaveNote<T> {
  const _$SaveNote(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'AddEditNoteUiEvent<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveNote<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveNoteCopyWith<T, _$SaveNote<T>> get copyWith =>
      __$$SaveNoteCopyWithImpl<T, _$SaveNote<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SaveNote<T> value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SaveNote<T> value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveNote<T> value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SaveNote<T> implements AddEditNoteUiEvent<T> {
  const factory SaveNote(final T data) = _$SaveNote<T>;

  @override
  T get data;
  @override
  @JsonKey(ignore: true)
  _$$SaveNoteCopyWith<T, _$SaveNote<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

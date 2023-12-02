// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appearance_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppearanceState {
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  String get font => throw _privateConstructorUsedError;
  String get monospaceFont => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppearanceStateCopyWith<AppearanceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppearanceStateCopyWith<$Res> {
  factory $AppearanceStateCopyWith(
          AppearanceState value, $Res Function(AppearanceState) then) =
      _$AppearanceStateCopyWithImpl<$Res, AppearanceState>;
  @useResult
  $Res call({ThemeMode themeMode, String font, String monospaceFont});
}

/// @nodoc
class _$AppearanceStateCopyWithImpl<$Res, $Val extends AppearanceState>
    implements $AppearanceStateCopyWith<$Res> {
  _$AppearanceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? font = null,
    Object? monospaceFont = null,
  }) {
    return _then(_value.copyWith(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      font: null == font
          ? _value.font
          : font // ignore: cast_nullable_to_non_nullable
              as String,
      monospaceFont: null == monospaceFont
          ? _value.monospaceFont
          : monospaceFont // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppearanceStateImplCopyWith<$Res>
    implements $AppearanceStateCopyWith<$Res> {
  factory _$$AppearanceStateImplCopyWith(_$AppearanceStateImpl value,
          $Res Function(_$AppearanceStateImpl) then) =
      __$$AppearanceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeMode themeMode, String font, String monospaceFont});
}

/// @nodoc
class __$$AppearanceStateImplCopyWithImpl<$Res>
    extends _$AppearanceStateCopyWithImpl<$Res, _$AppearanceStateImpl>
    implements _$$AppearanceStateImplCopyWith<$Res> {
  __$$AppearanceStateImplCopyWithImpl(
      _$AppearanceStateImpl _value, $Res Function(_$AppearanceStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? font = null,
    Object? monospaceFont = null,
  }) {
    return _then(_$AppearanceStateImpl(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      font: null == font
          ? _value.font
          : font // ignore: cast_nullable_to_non_nullable
              as String,
      monospaceFont: null == monospaceFont
          ? _value.monospaceFont
          : monospaceFont // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AppearanceStateImpl extends _AppearanceState {
  const _$AppearanceStateImpl(
      {required this.themeMode,
      required this.font,
      required this.monospaceFont})
      : super._();

  @override
  final ThemeMode themeMode;
  @override
  final String font;
  @override
  final String monospaceFont;

  @override
  String toString() {
    return 'AppearanceState(themeMode: $themeMode, font: $font, monospaceFont: $monospaceFont)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppearanceStateImpl &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.font, font) || other.font == font) &&
            (identical(other.monospaceFont, monospaceFont) ||
                other.monospaceFont == monospaceFont));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode, font, monospaceFont);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppearanceStateImplCopyWith<_$AppearanceStateImpl> get copyWith =>
      __$$AppearanceStateImplCopyWithImpl<_$AppearanceStateImpl>(
          this, _$identity);
}

abstract class _AppearanceState extends AppearanceState {
  const factory _AppearanceState(
      {required final ThemeMode themeMode,
      required final String font,
      required final String monospaceFont}) = _$AppearanceStateImpl;
  const _AppearanceState._() : super._();

  @override
  ThemeMode get themeMode;
  @override
  String get font;
  @override
  String get monospaceFont;
  @override
  @JsonKey(ignore: true)
  _$$AppearanceStateImplCopyWith<_$AppearanceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

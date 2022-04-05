// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'issues_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$IssuesStateTearOff {
  const _$IssuesStateTearOff();

  _IssuesState call(
      {bool init = false,
      bool isLoading = false,
      List<GithubData>? issuesDataList,
      int lastPage = 0}) {
    return _IssuesState(
      init: init,
      isLoading: isLoading,
      issuesDataList: issuesDataList,
      lastPage: lastPage,
    );
  }
}

/// @nodoc
const $IssuesState = _$IssuesStateTearOff();

/// @nodoc
mixin _$IssuesState {
  bool get init => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  List<GithubData>? get issuesDataList => throw _privateConstructorUsedError;
  int get lastPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IssuesStateCopyWith<IssuesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IssuesStateCopyWith<$Res> {
  factory $IssuesStateCopyWith(
          IssuesState value, $Res Function(IssuesState) then) =
      _$IssuesStateCopyWithImpl<$Res>;
  $Res call(
      {bool init,
      bool isLoading,
      List<GithubData>? issuesDataList,
      int lastPage});
}

/// @nodoc
class _$IssuesStateCopyWithImpl<$Res> implements $IssuesStateCopyWith<$Res> {
  _$IssuesStateCopyWithImpl(this._value, this._then);

  final IssuesState _value;
  // ignore: unused_field
  final $Res Function(IssuesState) _then;

  @override
  $Res call({
    Object? init = freezed,
    Object? isLoading = freezed,
    Object? issuesDataList = freezed,
    Object? lastPage = freezed,
  }) {
    return _then(_value.copyWith(
      init: init == freezed
          ? _value.init
          : init // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      issuesDataList: issuesDataList == freezed
          ? _value.issuesDataList
          : issuesDataList // ignore: cast_nullable_to_non_nullable
              as List<GithubData>?,
      lastPage: lastPage == freezed
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$IssuesStateCopyWith<$Res>
    implements $IssuesStateCopyWith<$Res> {
  factory _$IssuesStateCopyWith(
          _IssuesState value, $Res Function(_IssuesState) then) =
      __$IssuesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool init,
      bool isLoading,
      List<GithubData>? issuesDataList,
      int lastPage});
}

/// @nodoc
class __$IssuesStateCopyWithImpl<$Res> extends _$IssuesStateCopyWithImpl<$Res>
    implements _$IssuesStateCopyWith<$Res> {
  __$IssuesStateCopyWithImpl(
      _IssuesState _value, $Res Function(_IssuesState) _then)
      : super(_value, (v) => _then(v as _IssuesState));

  @override
  _IssuesState get _value => super._value as _IssuesState;

  @override
  $Res call({
    Object? init = freezed,
    Object? isLoading = freezed,
    Object? issuesDataList = freezed,
    Object? lastPage = freezed,
  }) {
    return _then(_IssuesState(
      init: init == freezed
          ? _value.init
          : init // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      issuesDataList: issuesDataList == freezed
          ? _value.issuesDataList
          : issuesDataList // ignore: cast_nullable_to_non_nullable
              as List<GithubData>?,
      lastPage: lastPage == freezed
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_IssuesState implements _IssuesState {
  const _$_IssuesState(
      {this.init = false,
      this.isLoading = false,
      this.issuesDataList,
      this.lastPage = 0});

  @JsonKey()
  @override
  final bool init;
  @JsonKey()
  @override
  final bool isLoading;
  @override
  final List<GithubData>? issuesDataList;
  @JsonKey()
  @override
  final int lastPage;

  @override
  String toString() {
    return 'IssuesState(init: $init, isLoading: $isLoading, issuesDataList: $issuesDataList, lastPage: $lastPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IssuesState &&
            const DeepCollectionEquality().equals(other.init, init) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.issuesDataList, issuesDataList) &&
            const DeepCollectionEquality().equals(other.lastPage, lastPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(init),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(issuesDataList),
      const DeepCollectionEquality().hash(lastPage));

  @JsonKey(ignore: true)
  @override
  _$IssuesStateCopyWith<_IssuesState> get copyWith =>
      __$IssuesStateCopyWithImpl<_IssuesState>(this, _$identity);
}

abstract class _IssuesState implements IssuesState {
  const factory _IssuesState(
      {bool init,
      bool isLoading,
      List<GithubData>? issuesDataList,
      int lastPage}) = _$_IssuesState;

  @override
  bool get init;
  @override
  bool get isLoading;
  @override
  List<GithubData>? get issuesDataList;
  @override
  int get lastPage;
  @override
  @JsonKey(ignore: true)
  _$IssuesStateCopyWith<_IssuesState> get copyWith =>
      throw _privateConstructorUsedError;
}

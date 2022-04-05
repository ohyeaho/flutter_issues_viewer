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
      bool filterSince = false,
      String filterState = 'all',
      String sortDirection = 'desc',
      int lastPage = 0,
      String sort = 'created'}) {
    return _IssuesState(
      init: init,
      isLoading: isLoading,
      issuesDataList: issuesDataList,
      filterSince: filterSince,
      filterState: filterState,
      sortDirection: sortDirection,
      lastPage: lastPage,
      sort: sort,
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
  bool get filterSince => throw _privateConstructorUsedError;
  String get filterState => throw _privateConstructorUsedError;
  String get sortDirection => throw _privateConstructorUsedError;
  int get lastPage => throw _privateConstructorUsedError;
  String get sort => throw _privateConstructorUsedError;

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
      bool filterSince,
      String filterState,
      String sortDirection,
      int lastPage,
      String sort});
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
    Object? filterSince = freezed,
    Object? filterState = freezed,
    Object? sortDirection = freezed,
    Object? lastPage = freezed,
    Object? sort = freezed,
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
      filterSince: filterSince == freezed
          ? _value.filterSince
          : filterSince // ignore: cast_nullable_to_non_nullable
              as bool,
      filterState: filterState == freezed
          ? _value.filterState
          : filterState // ignore: cast_nullable_to_non_nullable
              as String,
      sortDirection: sortDirection == freezed
          ? _value.sortDirection
          : sortDirection // ignore: cast_nullable_to_non_nullable
              as String,
      lastPage: lastPage == freezed
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      sort: sort == freezed
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String,
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
      bool filterSince,
      String filterState,
      String sortDirection,
      int lastPage,
      String sort});
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
    Object? filterSince = freezed,
    Object? filterState = freezed,
    Object? sortDirection = freezed,
    Object? lastPage = freezed,
    Object? sort = freezed,
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
      filterSince: filterSince == freezed
          ? _value.filterSince
          : filterSince // ignore: cast_nullable_to_non_nullable
              as bool,
      filterState: filterState == freezed
          ? _value.filterState
          : filterState // ignore: cast_nullable_to_non_nullable
              as String,
      sortDirection: sortDirection == freezed
          ? _value.sortDirection
          : sortDirection // ignore: cast_nullable_to_non_nullable
              as String,
      lastPage: lastPage == freezed
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      sort: sort == freezed
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_IssuesState implements _IssuesState {
  const _$_IssuesState(
      {this.init = false,
      this.isLoading = false,
      this.issuesDataList,
      this.filterSince = false,
      this.filterState = 'all',
      this.sortDirection = 'desc',
      this.lastPage = 0,
      this.sort = 'created'});

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
  final bool filterSince;
  @JsonKey()
  @override
  final String filterState;
  @JsonKey()
  @override
  final String sortDirection;
  @JsonKey()
  @override
  final int lastPage;
  @JsonKey()
  @override
  final String sort;

  @override
  String toString() {
    return 'IssuesState(init: $init, isLoading: $isLoading, issuesDataList: $issuesDataList, filterSince: $filterSince, filterState: $filterState, sortDirection: $sortDirection, lastPage: $lastPage, sort: $sort)';
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
            const DeepCollectionEquality()
                .equals(other.filterSince, filterSince) &&
            const DeepCollectionEquality()
                .equals(other.filterState, filterState) &&
            const DeepCollectionEquality()
                .equals(other.sortDirection, sortDirection) &&
            const DeepCollectionEquality().equals(other.lastPage, lastPage) &&
            const DeepCollectionEquality().equals(other.sort, sort));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(init),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(issuesDataList),
      const DeepCollectionEquality().hash(filterSince),
      const DeepCollectionEquality().hash(filterState),
      const DeepCollectionEquality().hash(sortDirection),
      const DeepCollectionEquality().hash(lastPage),
      const DeepCollectionEquality().hash(sort));

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
      bool filterSince,
      String filterState,
      String sortDirection,
      int lastPage,
      String sort}) = _$_IssuesState;

  @override
  bool get init;
  @override
  bool get isLoading;
  @override
  List<GithubData>? get issuesDataList;
  @override
  bool get filterSince;
  @override
  String get filterState;
  @override
  String get sortDirection;
  @override
  int get lastPage;
  @override
  String get sort;
  @override
  @JsonKey(ignore: true)
  _$IssuesStateCopyWith<_IssuesState> get copyWith =>
      throw _privateConstructorUsedError;
}

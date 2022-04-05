// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'github_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GithubData _$GithubDataFromJson(Map<String, dynamic> json) {
  return _GithubData.fromJson(json);
}

/// @nodoc
class _$GithubDataTearOff {
  const _$GithubDataTearOff();

  _GithubData call({int? number, int? commentCount, String? state, String? title, String? description, String? url, DateTime? createdAt, DateTime? updatedAt}) {
    return _GithubData(
      number: number,
      commentCount: commentCount,
      state: state,
      title: title,
      description: description,
      url: url,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  GithubData fromJson(Map<String, Object?> json) {
    return GithubData.fromJson(json);
  }
}

/// @nodoc
const $GithubData = _$GithubDataTearOff();

/// @nodoc
mixin _$GithubData {
  int? get number => throw _privateConstructorUsedError;
  int? get commentCount => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GithubDataCopyWith<GithubData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubDataCopyWith<$Res> {
  factory $GithubDataCopyWith(GithubData value, $Res Function(GithubData) then) = _$GithubDataCopyWithImpl<$Res>;
  $Res call({int? number, int? commentCount, String? state, String? title, String? description, String? url, DateTime? createdAt, DateTime? updatedAt});
}

/// @nodoc
class _$GithubDataCopyWithImpl<$Res> implements $GithubDataCopyWith<$Res> {
  _$GithubDataCopyWithImpl(this._value, this._then);

  final GithubData _value;
  // ignore: unused_field
  final $Res Function(GithubData) _then;

  @override
  $Res call({
    Object? number = freezed,
    Object? commentCount = freezed,
    Object? state = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      commentCount: commentCount == freezed
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$GithubDataCopyWith<$Res> implements $GithubDataCopyWith<$Res> {
  factory _$GithubDataCopyWith(_GithubData value, $Res Function(_GithubData) then) = __$GithubDataCopyWithImpl<$Res>;
  @override
  $Res call({int? number, int? commentCount, String? state, String? title, String? description, String? url, DateTime? createdAt, DateTime? updatedAt});
}

/// @nodoc
class __$GithubDataCopyWithImpl<$Res> extends _$GithubDataCopyWithImpl<$Res> implements _$GithubDataCopyWith<$Res> {
  __$GithubDataCopyWithImpl(_GithubData _value, $Res Function(_GithubData) _then) : super(_value, (v) => _then(v as _GithubData));

  @override
  _GithubData get _value => super._value as _GithubData;

  @override
  $Res call({
    Object? number = freezed,
    Object? commentCount = freezed,
    Object? state = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_GithubData(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      commentCount: commentCount == freezed
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GithubData implements _GithubData {
  const _$_GithubData({this.number, this.commentCount, this.state, this.title, this.description, this.url, this.createdAt, this.updatedAt});

  factory _$_GithubData.fromJson(Map<String, dynamic> json) => _$$_GithubDataFromJson(json);

  @override
  final int? number;
  @override
  final int? commentCount;
  @override
  final String? state;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? url;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'GithubData(number: $number, commentCount: $commentCount, state: $state, title: $title, description: $description, url: $url, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GithubData &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.commentCount, commentCount) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(commentCount),
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$GithubDataCopyWith<_GithubData> get copyWith => __$GithubDataCopyWithImpl<_GithubData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GithubDataToJson(this);
  }
}

abstract class _GithubData implements GithubData {
  const factory _GithubData(
      {int? number,
      int? commentCount,
      String? state,
      String? title,
      String? description,
      String? url,
      DateTime? createdAt,
      DateTime? updatedAt}) = _$_GithubData;

  factory _GithubData.fromJson(Map<String, dynamic> json) = _$_GithubData.fromJson;

  @override
  int? get number;
  @override
  int? get commentCount;
  @override
  String? get state;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get url;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$GithubDataCopyWith<_GithubData> get copyWith => throw _privateConstructorUsedError;
}

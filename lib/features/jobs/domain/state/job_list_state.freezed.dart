// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$JobList {
  List<JobModel> get values => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JobListCopyWith<JobList> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobListCopyWith<$Res> {
  factory $JobListCopyWith(JobList value, $Res Function(JobList) then) =
      _$JobListCopyWithImpl<$Res, JobList>;
  @useResult
  $Res call({List<JobModel> values});
}

/// @nodoc
class _$JobListCopyWithImpl<$Res, $Val extends JobList>
    implements $JobListCopyWith<$Res> {
  _$JobListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
  }) {
    return _then(_value.copyWith(
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<JobModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_JobListCopyWith<$Res> implements $JobListCopyWith<$Res> {
  factory _$$_JobListCopyWith(
          _$_JobList value, $Res Function(_$_JobList) then) =
      __$$_JobListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<JobModel> values});
}

/// @nodoc
class __$$_JobListCopyWithImpl<$Res>
    extends _$JobListCopyWithImpl<$Res, _$_JobList>
    implements _$$_JobListCopyWith<$Res> {
  __$$_JobListCopyWithImpl(_$_JobList _value, $Res Function(_$_JobList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
  }) {
    return _then(_$_JobList(
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<JobModel>,
    ));
  }
}

/// @nodoc

class _$_JobList extends _JobList {
  const _$_JobList({required final List<JobModel> values})
      : _values = values,
        super._();

  final List<JobModel> _values;
  @override
  List<JobModel> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  String toString() {
    return 'JobList(values: $values)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JobList &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_values));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JobListCopyWith<_$_JobList> get copyWith =>
      __$$_JobListCopyWithImpl<_$_JobList>(this, _$identity);
}

abstract class _JobList extends JobList {
  const factory _JobList({required final List<JobModel> values}) = _$_JobList;
  const _JobList._() : super._();

  @override
  List<JobModel> get values;
  @override
  @JsonKey(ignore: true)
  _$$_JobListCopyWith<_$_JobList> get copyWith =>
      throw _privateConstructorUsedError;
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:job_seeker/features/jobs/domain/jobs_model/job_response_model.dart';
part 'job_list_state.freezed.dart';

@freezed
class JobList with _$JobList {
  const factory JobList({
    required List<JobModel> values,
  }) = _JobList;

  const JobList._();

  operator [](final int index) => values[index];

  int get length => values.length;

}

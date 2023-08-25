import 'package:freezed_annotation/freezed_annotation.dart';
part 'job_response_model.freezed.dart';


@freezed
class JobModel with _$JobModel{
  const factory JobModel({
    required  int jobId,
    required int userId,
    required   int jobCategory,
    required String jobProviderName,
    required String? website,
    required String title,
    required dynamic currency,
    required  String description,
    required  String location,
    required String lat,
    required String lng,
    required  int jobType,
    required  int isSalaryFixed,
    required int? salaryType,
    required String? salary,
    required int experienceRequired,
    required String createdAt,
    required dynamic additionalInfo,
    required double distance,
    required dynamic status,
    required dynamic appliedOn,
    required int isSaved,

  })= _JobModel;

  const JobModel._();

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
    jobId: json["job_id"],
    userId: json["user_id"],
    jobCategory: json["job_category"],
    jobProviderName: json["job_provider_name"] ?? 'NA',
    website: json["website"],
    title: json["title"] ?? 'NA',
    currency: json["currency"],
    description: json["description"] ?? 'NA',
    location: json["location"] ??'NA',
    lat: json["lat"],
    lng: json["lng"],
    jobType: json["job_type"] ?? 1,
    isSalaryFixed: json["is_salary_fixed"],
    salaryType: json["salary_type"],
    salary: json["salary"] ?? '',
    experienceRequired: json["experience_required"],
    createdAt: json["created_at"],
    additionalInfo: json["additional_info"],
    distance: json["distance"]?.toDouble(),
    status: json["status"],
    appliedOn: json["applied_on"],
    isSaved: json["is_saved"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "job_id": jobId,
    "user_id": userId,
    "job_category": jobCategory,
    "job_provider_name": jobProviderName,
    "website": website,
    "title": title,
    "currency": currency,
    "description": description,
    "location": location,
    "lat": lat,
    "lng": lng,
    "job_type": jobType,
    "is_salary_fixed": isSalaryFixed,
    "salary_type": salaryType,
    "salary": salary,
    "experience_required": experienceRequired,
    "created_at": createdAt,
    "additional_info": additionalInfo,
    "distance": distance,
    "status": status,
    "applied_on": appliedOn,
    "is_saved": isSaved,
  };
}



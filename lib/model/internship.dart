import 'dart:convert';

class Internship {
  final int id;
  final String title;
  final String companyName;
  final String stipend;
  final String companyUrl;
  final String companyLogo;

  final List<String> locationNames;
  final String duration;
  final String type;
  final String employmentType;
  final String startDate;
  final String? jobExperience;
  final String? postedOn;
  final String? experience;
  final String? applicationDeadline;

  Internship({
    required this.id,
    required this.title,
    required this.companyName,
    required this.companyLogo,
    required this.companyUrl,
    required this.stipend,
    required this.locationNames,
    required this.duration,
    required this.type,
    required this.employmentType,
    required this.startDate,
    required this.jobExperience,
    required this.postedOn,
    required this.experience,
    required this.applicationDeadline,
  });

  factory Internship.fromJson(Map<String, dynamic> json) {
    return Internship(
      id: json['id'],
      title: json['title'],
      companyName: json['company_name'],
      stipend: json['stipend']['salary'],
      locationNames: List<String>.from(json['location_names']),
      duration: json['duration'],
      type: json['type'],
      postedOn: json['posted_on'],
      employmentType: json['employment_type'],
      startDate: json['start_date'],
      jobExperience: json['job_experience'],
      experience: json['experience'],
      applicationDeadline: json['application_deadline'],
      companyUrl: json['company_url'],
      companyLogo: json['company_logo'],
    );
  }

  static List<Internship> fromJsonList(Map<String, dynamic> json) {
    List<Internship> internships = [];
    json.forEach((key, value) {
      internships.add(Internship.fromJson(value));
    });
    return internships;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'company_name': companyName,
      'stipend': stipend,
      'location_names': locationNames,
      'duration': duration,
      'type': type,
      'employment_type': employmentType,
      'start_date': startDate,
      'job_experience': jobExperience,
      'experience': experience,
      'postedOn': postedOn,
      'application_deadline': applicationDeadline,
    };
  }
}

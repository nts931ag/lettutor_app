import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/Feedback.dart';

class Tutor extends Equatable {
  String level;
  String email;
  dynamic google;
  dynamic facebook;
  dynamic apple;
  String avatar;
  String name;
  String country;
  String phone;
  String language;
  String birthday;
  bool requestPassword;
  bool isActivated;
  dynamic isPhoneActivated;
  dynamic requireNote;
  int timezone;
  dynamic phoneAuth;
  bool isPhoneAuthActivated;
  String studySchedule;
  bool canSendMessage;
  bool isPublicRecord;
  dynamic caredByStaffId;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  dynamic studentGroupId;
  String id;
  String userId;
  String video;
  String bio;
  String education;
  String experience;
  String profession;
  dynamic accent;
  String targetStudent;
  String interests;
  String languages;
  String specialties;
  dynamic resume;
  double rating;
  dynamic isNative;
  int price;
  bool isOnline;
  List<Feedback>? feedbacks;

  Tutor({
    required this.level,
    required this.email,
    required this.google,
    required this.facebook,
    required this.apple,
    required this.avatar,
    required this.name,
    required this.country,
    required this.phone,
    required this.language,
    required this.birthday,
    required this.requestPassword,
    required this.isActivated,
    required this.isPhoneActivated,
    required this.requireNote,
    required this.timezone,
    required this.phoneAuth,
    required this.isPhoneAuthActivated,
    required this.studySchedule,
    required this.canSendMessage,
    required this.isPublicRecord,
    required this.caredByStaffId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.studentGroupId,
    required this.id,
    required this.userId,
    required this.video,
    required this.bio,
    required this.education,
    required this.experience,
    required this.profession,
    required this.accent,
    required this.targetStudent,
    required this.interests,
    required this.languages,
    required this.specialties,
    required this.resume,
    required this.rating,
    required this.isNative,
    required this.price,
    required this.isOnline,
    this.feedbacks,
  });

  Map<String, dynamic> toMap() {
    return {
      'level': this.level,
      'email': this.email,
      'google': this.google,
      'facebook': this.facebook,
      'apple': this.apple,
      'avatar': this.avatar,
      'name': this.name,
      'country': this.country,
      'phone': this.phone,
      'language': this.language,
      'birthday': this.birthday,
      'requestPassword': this.requestPassword,
      'isActivated': this.isActivated,
      'isPhoneActivated': this.isPhoneActivated,
      'requireNote': this.requireNote,
      'timezone': this.timezone,
      'phoneAuth': this.phoneAuth,
      'isPhoneAuthActivated': this.isPhoneAuthActivated,
      'studySchedule': this.studySchedule,
      'canSendMessage': this.canSendMessage,
      'isPublicRecord': this.isPublicRecord,
      'caredByStaffId': this.caredByStaffId,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
      'deletedAt': this.deletedAt,
      'studentGroupId': this.studentGroupId,
      'id': this.id,
      'userId': this.userId,
      'video': this.video,
      'bio': this.bio,
      'education': this.education,
      'experience': this.experience,
      'profession': this.profession,
      'accent': this.accent,
      'targetStudent': this.targetStudent,
      'interests': this.interests,
      'languages': this.languages,
      'specialties': this.specialties,
      'resume': this.resume,
      'rating': this.rating,
      'isNative': this.isNative,
      'price': this.price,
      'isOnline': this.isOnline,
      'feedbacks': this.feedbacks,
    };
  }

  factory Tutor.fromMap(Map<String, dynamic> map) {
    return Tutor(
      level: map['level'] as String,
      email: map['email'] as String,
      google: map['google'] as dynamic,
      facebook: map['facebook'] as dynamic,
      apple: map['apple'] as dynamic,
      avatar: map['avatar'] as String,
      name: map['name'] as String,
      country: map['country'] as String,
      phone: map['phone'] as String,
      language: map['language'] as String,
      birthday: map['birthday'] as String,
      requestPassword: map['requestPassword'] as bool,
      isActivated: map['isActivated'] as bool,
      isPhoneActivated: map['isPhoneActivated'] as dynamic,
      requireNote: map['requireNote'] as dynamic,
      timezone: map['timezone'] as int,
      phoneAuth: map['phoneAuth'] as dynamic,
      isPhoneAuthActivated: map['isPhoneAuthActivated'] as bool,
      studySchedule: map['studySchedule'] as String,
      canSendMessage: map['canSendMessage'] as bool,
      isPublicRecord: map['isPublicRecord'] as bool,
      caredByStaffId: map['caredByStaffId'] as dynamic,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      deletedAt: map['deletedAt'] as dynamic,
      studentGroupId: map['studentGroupId'] as dynamic,
      id: map['id'] as String,
      userId: map['userId'] as String,
      video: map['video'] as String,
      bio: map['bio'] as String,
      education: map['education'] as String,
      experience: map['experience'] as String,
      profession: map['profession'] as String,
      accent: map['accent'] as dynamic,
      targetStudent: map['targetStudent'] as String,
      interests: map['interests'] as String,
      languages: map['languages'] as String,
      specialties: map['specialties'] as String,
      resume: map['resume'] as dynamic,
      rating: map['rating'] as double,
      isNative: map['isNative'] as dynamic,
      price: map['price'] as int,
      isOnline: map['isOnline'] as bool,
      feedbacks: map['feedbacks'] as List<Feedback>,
    );
  }

  @override
  List<Object> get props => [];
}
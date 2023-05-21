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
  int? timezone;
  dynamic phoneAuth;
  bool isPhoneAuthActivated;
  String studySchedule;
  bool canSendMessage;
  bool isPublicRecord;
  dynamic caredByStaffId;
  DateTime createdAt;
  DateTime updatedAt;
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
  bool isFavoriteTutor;
  List<Feedback>? feedbacks;

  Tutor(
      {required this.level,
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
      this.timezone,
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
      required this.isFavoriteTutor});

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
      'isFavoriteTutor': this.isFavoriteTutor
    };
  }

  factory Tutor.fromMap(Map<String, dynamic> map) {
    return Tutor(
      level: map['level'] ?? '',
      email: map['email'] ?? '',
      google: map['google'] as dynamic,
      facebook: map['facebook'] as dynamic,
      apple: map['apple'] as dynamic,
      avatar: map['avatar'] ?? '',
      name: map['name'] as String,
      country: map['country'] ?? '',
      phone: map['phone'] ?? '',
      language: map['language'] ?? '',
      birthday: map['birthday'] ?? '',
      requestPassword: map['requestPassword'] ?? false,
      isActivated: map['isActivated'] ?? false,
      isPhoneActivated: map['isPhoneActivated'] ?? '',
      requireNote: map['requireNote'] as dynamic,
      timezone: map['timezone'],
      phoneAuth: map['phoneAuth'] as dynamic,
      isPhoneAuthActivated: map['isPhoneAuthActivated'] ?? false,
      studySchedule: map['studySchedule'] ?? '',
      canSendMessage: map['canSendMessage'] ?? false,
      isPublicRecord: map['isPublicRecord'] ?? false,
      caredByStaffId: map['caredByStaffId'] as dynamic,
      createdAt: DateTime.parse(map['createdAt'] as String),
      updatedAt: DateTime.parse(map['updatedAt'] as String),
      deletedAt: map['deletedAt'] as dynamic,
      studentGroupId: map['studentGroupId'] as dynamic,
      id: map['id'] as String,
      userId: map['userId'] ?? '',
      video: map['video'] ?? '',
      bio: map['bio'] ?? '',
      education: map['education'] ?? '',
      experience: map['experience'] ?? '',
      profession: map['profession'] ?? '',
      accent: map['accent'] as dynamic,
      targetStudent: map['targetStudent'] ?? '',
      interests: map['interests'] ?? '',
      languages: map['languages'] ?? '',
      specialties: map['specialties'] ?? '',
      resume: map['resume'] as dynamic,
      rating: map['rating'] ?? 0.0,
      isNative: map['isNative'] as dynamic,
      price: map['price'] ?? 0,
      isOnline: map['isOnline'] ?? false,
      isFavoriteTutor: map['isfavoritetutor'] != null ? true : false,
      feedbacks: map['feedbacks'] == null
          ? null
          : List<Feedback>.from(
              map['feedbacks'].map<Feedback>(
                (x) => Feedback.fromMap(x as Map<String, dynamic>),
              ),
            ),
    );
  }

  @override
  List<Object?> get props => [
        level,
        email,
        google,
        facebook,
        apple,
        avatar,
        name,
        country,
        phone,
        language,
        birthday,
        requestPassword,
        isActivated,
        isPhoneActivated,
        requireNote,
        timezone,
        phoneAuth,
        isPhoneAuthActivated,
        studySchedule,
        canSendMessage,
        isPublicRecord,
        caredByStaffId,
        createdAt,
        updatedAt,
        deletedAt,
        studentGroupId,
        id,
        userId,
        video,
        bio,
        education,
        experience,
        profession,
        accent,
        targetStudent,
        interests,
        languages,
        specialties,
        resume,
        rating,
        isNative,
        price,
        isOnline,
        isFavoriteTutor,
        feedbacks,
      ];

  Tutor copyWith({
    String? level,
    String? email,
    dynamic? google,
    dynamic? facebook,
    dynamic? apple,
    String? avatar,
    String? name,
    String? country,
    String? phone,
    String? language,
    String? birthday,
    bool? requestPassword,
    bool? isActivated,
    dynamic? isPhoneActivated,
    dynamic? requireNote,
    int? timezone,
    dynamic? phoneAuth,
    bool? isPhoneAuthActivated,
    String? studySchedule,
    bool? canSendMessage,
    bool? isPublicRecord,
    dynamic? caredByStaffId,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic? deletedAt,
    dynamic? studentGroupId,
    String? id,
    String? userId,
    String? video,
    String? bio,
    String? education,
    String? experience,
    String? profession,
    dynamic? accent,
    String? targetStudent,
    String? interests,
    String? languages,
    String? specialties,
    dynamic? resume,
    double? rating,
    dynamic? isNative,
    int? price,
    bool? isOnline,
    bool? isFavoriteTutor,
    List<Feedback>? feedbacks,
  }) {
    return Tutor(
      level: level ?? this.level,
      email: email ?? this.email,
      google: google ?? this.google,
      facebook: facebook ?? this.facebook,
      apple: apple ?? this.apple,
      avatar: avatar ?? this.avatar,
      name: name ?? this.name,
      country: country ?? this.country,
      phone: phone ?? this.phone,
      language: language ?? this.language,
      birthday: birthday ?? this.birthday,
      requestPassword: requestPassword ?? this.requestPassword,
      isActivated: isActivated ?? this.isActivated,
      isPhoneActivated: isPhoneActivated ?? this.isPhoneActivated,
      requireNote: requireNote ?? this.requireNote,
      timezone: timezone ?? this.timezone,
      phoneAuth: phoneAuth ?? this.phoneAuth,
      isPhoneAuthActivated: isPhoneAuthActivated ?? this.isPhoneAuthActivated,
      studySchedule: studySchedule ?? this.studySchedule,
      canSendMessage: canSendMessage ?? this.canSendMessage,
      isPublicRecord: isPublicRecord ?? this.isPublicRecord,
      caredByStaffId: caredByStaffId ?? this.caredByStaffId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      studentGroupId: studentGroupId ?? this.studentGroupId,
      id: id ?? this.id,
      userId: userId ?? this.userId,
      video: video ?? this.video,
      bio: bio ?? this.bio,
      education: education ?? this.education,
      experience: experience ?? this.experience,
      profession: profession ?? this.profession,
      accent: accent ?? this.accent,
      targetStudent: targetStudent ?? this.targetStudent,
      interests: interests ?? this.interests,
      languages: languages ?? this.languages,
      specialties: specialties ?? this.specialties,
      resume: resume ?? this.resume,
      rating: rating ?? this.rating,
      isNative: isNative ?? this.isNative,
      price: price ?? this.price,
      isOnline: isOnline ?? this.isOnline,
      isFavoriteTutor: isFavoriteTutor ?? this.isFavoriteTutor,
      feedbacks: feedbacks ?? this.feedbacks,
    );
  }
}

import 'package:equatable/equatable.dart';

class FirstInfo extends Equatable {
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
  bool isPhoneActivated;
  String requireNote;
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

  FirstInfo({
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
    };
  }

  factory FirstInfo.fromMap(Map<String, dynamic> map) {
    return FirstInfo(
      level: map['level'] ?? '',
      email: map['email'] as String,
      google: map['google'] as dynamic,
      facebook: map['facebook'] as dynamic,
      apple: map['apple'] as dynamic,
      avatar: map['avatar'] as String,
      name: map['name'] as String,
      country: map['country'] ?? '',
      phone: map['phone'] ?? '',
      language: map['language'] ?? '',
      birthday: map['birthday'] ?? '',
      requestPassword: map['requestPassword'] as bool,
      isActivated: map['isActivated'] as bool,
      isPhoneActivated: map['isPhoneActivated'] ?? false,
      requireNote: map['requireNote'] ?? '',
      timezone: map['timezone'] as int,
      phoneAuth: map['phoneAuth'] as dynamic,
      isPhoneAuthActivated: map['isPhoneAuthActivated'] as bool,
      studySchedule: map['studySchedule'] ?? '',
      canSendMessage: map['canSendMessage'] as bool,
      isPublicRecord: map['isPublicRecord'] as bool,
      caredByStaffId: map['caredByStaffId'] as dynamic,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      deletedAt: map['deletedAt'] as dynamic,
      studentGroupId: map['studentGroupId'] as dynamic,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
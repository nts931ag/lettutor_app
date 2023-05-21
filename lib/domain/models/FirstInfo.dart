import 'package:equatable/equatable.dart';

class FirstInfo extends Equatable {
  String? level;
  String? email;
  dynamic? google;
  dynamic? facebook;
  dynamic? apple;
  String avatar;
  String name;
  String? country;
  String? phone;
  String? language;
  String? birthday;
  bool? requestPassword;
  bool? isActivated;
  bool? isPhoneActivated;
  String? requireNote;
  int? timezone;
  dynamic? phoneAuth;
  bool? isPhoneAuthActivated;
  String? studySchedule;
  bool? canSendMessage;
  bool? isPublicRecord;
  dynamic? caredByStaffId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic? deletedAt;
  dynamic? studentGroupId;

  FirstInfo({
    this.level,
    this.email,
    this.google,
    this.facebook,
    this.apple,
    required this.avatar,
    required this.name,
    this.country,
    this.phone,
    this.language,
    this.birthday,
    this.requestPassword,
    this.isActivated,
    this.isPhoneActivated,
    this.requireNote,
    this.timezone,
    this.phoneAuth,
    this.isPhoneAuthActivated,
    this.studySchedule,
    this.canSendMessage,
    this.isPublicRecord,
    this.caredByStaffId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.studentGroupId,
  });

  Map<String, dynamic> toMap() {
    return {
      'level': level,
      'email': email,
      'google': google,
      'facebook': facebook,
      'apple': apple,
      'avatar': avatar,
      'name': name,
      'country': country,
      'phone': phone,
      'language': language,
      'birthday': birthday,
      'requestPassword': requestPassword,
      'isActivated': isActivated,
      'isPhoneActivated': isPhoneActivated,
      'requireNote': requireNote,
      'timezone': timezone,
      'phoneAuth': phoneAuth,
      'isPhoneAuthActivated': isPhoneAuthActivated,
      'studySchedule': studySchedule,
      'canSendMessage': canSendMessage,
      'isPublicRecord': isPublicRecord,
      'caredByStaffId': caredByStaffId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'studentGroupId': studentGroupId,
    };
  }

  factory FirstInfo.fromMap(Map<String, dynamic> map) {
    return FirstInfo(
      level: map['level'] ?? '',
      email: map['email'] ?? '',
      google: map['google'] as dynamic?,
      facebook: map['facebook'] as dynamic?,
      apple: map['apple'] as dynamic?,
      avatar: map['avatar'] as String,
      name: map['name'] as String,
      country: map['country'] ?? '',
      phone: map['phone'] ?? '',
      language: map['language'] ?? '',
      birthday: map['birthday'] ?? '',
      requestPassword: map['requestPassword'] as bool?,
      isActivated: map['isActivated'] as bool?,
      isPhoneActivated: map['isPhoneActivated'] ?? false,
      requireNote: map['requireNote'] ?? '',
      timezone: map['timezone'] as int?,
      phoneAuth: map['phoneAuth'] as dynamic?,
      isPhoneAuthActivated: map['isPhoneAuthActivated'] as bool?,
      studySchedule: map['studySchedule'] ?? '',
      canSendMessage: map['canSendMessage'] as bool?,
      isPublicRecord: map['isPublicRecord'] as bool?,
      caredByStaffId: map['caredByStaffId'] as dynamic?,
      createdAt: map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
      updatedAt: map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
      deletedAt: map['deletedAt'] as dynamic?,
      studentGroupId: map['studentGroupId'] as dynamic?,
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
      ];
}

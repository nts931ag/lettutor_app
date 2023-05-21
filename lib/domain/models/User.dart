import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/Course.dart';
import 'package:lettutor_app/domain/models/LearnTopic.dart';
import 'package:lettutor_app/domain/models/TestPreparation.dart';
import 'package:lettutor_app/domain/models/WalletInfo.dart';

class User extends Equatable {
  String? id;
  String? email;
  String? name;
  String? avatar;
  String? country;
  String? phone;
  List<String>? roles;
  String? language;
  String? birthday;
  bool? isActivated;
  WalletInfo? walletInfo;
  String? requireNote;
  String? level;
  List<TestPreparation>? testPreparations;
  bool? isPhoneActivated;
  int? timezone;
  String? studySchedule;
  bool? canSendMessage;
  List<LearnTopic>? learnTopics;
  List<Course>? courses;

  User({
    this.id,
    this.email,
    this.name,
    this.avatar,
    this.country,
    this.phone,
    this.roles,
    this.language,
    this.birthday,
    this.isActivated,
    this.walletInfo,
    this.requireNote,
    this.level,
    this.testPreparations,
    this.isPhoneActivated,
    this.timezone,
    this.studySchedule,
    this.canSendMessage,
    this.learnTopics,
    this.courses,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'email': this.email,
      'name': this.name,
      'avatar': this.avatar,
      'country': this.country,
      'phone': this.phone,
      'roles': this.roles,
      'language': this.language,
      'birthday': this.birthday,
      'isActivated': this.isActivated,
      'walletInfo': this.walletInfo,
      'requireNote': this.requireNote,
      'level': this.level,
      'testPreparations': this.testPreparations,
      'isPhoneActivated': this.isPhoneActivated,
      'timezone': this.timezone,
      'studySchedule': this.studySchedule,
      'canSendMessage': this.canSendMessage,
      'learnTopics': this.learnTopics,
      'courses': this.courses,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String?,
      email: map['email'] as String?,
      name: map['name'] as String?,
      avatar: map['avatar'] as String?,
      country: map['country'] as String?,
      phone: map['phone'] as String?,
      roles: map['roles'] != null ? List<String>.from(map['roles']) : [],
      language: map['language'] as String?,
      birthday: map['birthday'] as String?,
      isActivated: map['isActivated'] as bool?,
      walletInfo: map['walletInfo'] != null
          ? WalletInfo.fromMap(map['walletInfo'])
          : null,
      requireNote: map['requireNote'] as String?,
      level: map['level'] as String?,
      testPreparations: map['testPreparations'] != null
          ? List<TestPreparation>.from(
              map['testPreparations'].map<TestPreparation>(
                (x) => TestPreparation.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      isPhoneActivated: map['isPhoneActivated'] as bool?,
      timezone: map['timezone'] as int?,
      studySchedule: map['studySchedule'] as String?,
      canSendMessage: map['canSendMessage'] as bool?,
      learnTopics: map['learnTopics'] != null
          ? List<LearnTopic>.from(
              map['learnTopics'].map<LearnTopic>(
                (x) => LearnTopic.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      courses: map['courses'] != null
          ? List<Course>.from(
              map['courses'].map<Course>(
                (x) => Course.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        avatar,
        country,
        phone,
        roles,
        language,
        birthday,
        isActivated,
        walletInfo,
        requireNote,
        level,
        testPreparations,
        isPhoneActivated,
        timezone,
        studySchedule,
        canSendMessage,
        learnTopics,
        courses,
      ];

  @override
  String toString() {
    return 'User{id: $id, email: $email, name: $name, avatar: $avatar, country: $country, phone: $phone, roles: $roles, language: $language, birthday: $birthday, isActivated: $isActivated, walletInfo: $walletInfo, requireNote: $requireNote, level: $level, testPreparations: $testPreparations, isPhoneActivated: $isPhoneActivated, timezone: $timezone, studySchedule: $studySchedule, canSendMessage: $canSendMessage, learnTopics: $learnTopics, courses: $courses}';
  }

  User copyWith({
    String? id,
    String? email,
    String? name,
    String? avatar,
    String? country,
    String? phone,
    List<String>? roles,
    String? language,
    String? birthday,
    bool? isActivated,
    WalletInfo? walletInfo,
    String? requireNote,
    String? level,
    List<TestPreparation>? testPreparations,
    bool? isPhoneActivated,
    int? timezone,
    String? studySchedule,
    bool? canSendMessage,
    List<LearnTopic>? learnTopics,
    List<Course>? courses,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      country: country ?? this.country,
      phone: phone ?? this.phone,
      roles: roles ?? this.roles,
      language: language ?? this.language,
      birthday: birthday ?? this.birthday,
      isActivated: isActivated ?? this.isActivated,
      walletInfo: walletInfo ?? this.walletInfo,
      requireNote: requireNote ?? this.requireNote,
      level: level ?? this.level,
      testPreparations: testPreparations ?? this.testPreparations,
      isPhoneActivated: isPhoneActivated ?? this.isPhoneActivated,
      timezone: timezone ?? this.timezone,
      studySchedule: studySchedule ?? this.studySchedule,
      canSendMessage: canSendMessage ?? this.canSendMessage,
      learnTopics: learnTopics ?? this.learnTopics,
      courses: courses ?? this.courses,
    );
  }
}

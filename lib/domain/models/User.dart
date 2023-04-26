import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/Course.dart';
import 'package:lettutor_app/domain/models/LearnTopic.dart';
import 'package:lettutor_app/domain/models/TestPreparation.dart';
import 'package:lettutor_app/domain/models/WalletInfo.dart';

class User extends Equatable {
  String id;
  String email;
  String name;
  String avatar;
  String country;
  String phone;
  List<String> roles;
  String language;
  String birthday;
  bool isActivated;
  WalletInfo walletInfo;
  String requireNote;
  String level;
  List<TestPreparation> testPreparations;
  bool isPhoneActivated;
  int timezone;
  String studySchedule;
  bool canSendMessage;
  List<LearnTopic> learnTopics;
  List<Course> courses;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
    required this.country,
    required this.phone,
    required this.roles,
    required this.language,
    required this.birthday,
    required this.isActivated,
    required this.walletInfo,
    required this.requireNote,
    required this.level,
    required this.testPreparations,
    required this.isPhoneActivated,
    required this.timezone,
    required this.studySchedule,
    required this.canSendMessage,
    required this.learnTopics,
    required this.courses,
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
      id: map['id'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      avatar: map['avatar'] as String,
      country: map['country'] as String,
      phone: map['phone'] as String,
      roles: List<String>.from(map['roles']),
      language: map['language'] as String,
      birthday: map['birthday'] as String,
      isActivated: map['isActivated'] as bool,
      walletInfo: WalletInfo.fromMap(map['walletInfo']),
      requireNote: map['requireNote'] as String,
      level: map['level'] as String,
      testPreparations: List<TestPreparation>.from(
        map['testPreparations'].map<TestPreparation>(
          (x) => TestPreparation.fromMap(x as Map<String, dynamic>),
        ),
      ),
      isPhoneActivated: map['isPhoneActivated'] as bool,
      timezone: map['timezone'] as int,
      studySchedule: map['studySchedule'] as String,
      canSendMessage: map['canSendMessage'] as bool,
      learnTopics: List<LearnTopic>.from(
        map['learnTopics'].map<LearnTopic>(
          (x) => LearnTopic.fromMap(x as Map<String, dynamic>),
        ),
      ),
      courses: List<Course>.from(
        map['courses'].map<Course>(
          (x) => Course.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  @override
  // TODO: implement props
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
        walletInfo,
        courses,
        requireNote,
        level,
        learnTopics,
        testPreparations,
        timezone,
        studySchedule,
        canSendMessage
      ];
}

import 'WalletInfo.dart';
import 'Courses.dart';
import 'LearnTopics.dart';
import 'TestPreparations.dart';

class User {
  final String id;
  final String email;
  final String name;
  final String avatar;
  final String country;
  final String phone;
  final List<String> roles;
  final String language;
  final String birthday;
  final bool isActivated;
  final WalletInfo walletInfo;
  final List<Courses> courses;
  final String requireNote;
  final String level;
  final List<LearnTopics> learnTopics;
  final List<TestPreparations> testPreparations;
  final bool isPhoneActivated;
  final int timezone;
  final String studySchedule;
  final bool canSendMessage;



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
      'courses': this.courses,
      'requireNote': this.requireNote,
      'level': this.level,
      'learnTopics': this.learnTopics,
      'testPreparations': this.testPreparations,
      'isPhoneActivated': this.isPhoneActivated,
      'timezone': this.timezone,
      'studySchedule': this.studySchedule,
      'canSendMessage': this.canSendMessage,
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
      roles: map['roles'] as List<String>,
      language: map['language'] as String,
      birthday: map['birthday'] as String,
      isActivated: map['isActivated'] as bool,
      walletInfo: map['walletInfo'] as WalletInfo,
      courses: map['courses'] as List<Courses>,
      requireNote: map['requireNote'] as String,
      level: map['level'] as String,
      learnTopics: map['learnTopics'] as List<LearnTopics>,
      testPreparations: map['testPreparations'] as List<TestPreparations>,
      isPhoneActivated: map['isPhoneActivated'] as bool,
      timezone: map['timezone'] as int,
      studySchedule: map['studySchedule'] as String,
      canSendMessage: map['canSendMessage'] as bool,
    );
  }

  const User({
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
    required this.courses,
    required this.requireNote,
    required this.level,
    required this.learnTopics,
    required this.testPreparations,
    required this.isPhoneActivated,
    required this.timezone,
    required this.studySchedule,
    required this.canSendMessage,
  });
}
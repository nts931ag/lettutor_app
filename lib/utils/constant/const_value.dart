import 'package:equatable/equatable.dart';
import 'package:lettutor_app/domain/models/LearnTopic.dart';
import 'package:lettutor_app/domain/models/TestPreparation.dart';

class NavigationIndex {
  static const tutorListScreen = 0;
  static const courseListScreen = 1;
  static const scheduleScreen = 2;
  static const historyScreen = 3;
  static const settingsScreen = 4;
}

enum SpecialitiesGroup {
  testPreparation,
  topic;
}

extension SpecialitiesGroupExtension on SpecialitiesGroup {
  String get value {
    switch (this) {
      case SpecialitiesGroup.testPreparation:
        return "Test Preparation";
      case SpecialitiesGroup.topic:
        return "Learn Topic";
      default:
        return "Test Preparation";
    }
  }
}

class Specialities extends Equatable {
  final int id;
  final String key;
  final String title;
  final SpecialitiesGroup group;

  @override
  List<Object> get props => [id, key, title, group];

  const Specialities({
    required this.id,
    required this.key,
    required this.title,
    required this.group,
  });
  
  LearnTopic toLearnTopic() {
    return LearnTopic(id: id, key: key, name: title);
  }

  TestPreparation toTestPreparation() {
    return TestPreparation(id: id, key: key, name: title);
  }
  
}

List<Specialities> specialitiesCutom = [
  const Specialities(
    key: 'starters',
    title: 'STARTERS',
    id: 1,
    group: SpecialitiesGroup.testPreparation,
  ),
  const Specialities(
    key: 'movers',
    title: 'MOVERS',
    id: 2,
    group: SpecialitiesGroup.testPreparation,
  ),
  const Specialities(
    key: 'flyers',
    title: 'FLYERS',
    id: 3,
    group: SpecialitiesGroup.testPreparation,
  ),
  const Specialities(
    key: 'ket',
    title: 'KET',
    id: 4,
    group: SpecialitiesGroup.testPreparation,
  ),
  const Specialities(
    key: 'pet',
    title: 'PET',
    id: 5,
    group: SpecialitiesGroup.testPreparation,
  ),
  const Specialities(
    key: 'ielts',
    title: 'IELTS',
    id: 6,
    group: SpecialitiesGroup.testPreparation,
  ),
  const Specialities(
    key: 'toefl',
    title: 'TOEFL',
    id: 7,
    group: SpecialitiesGroup.testPreparation,
  ),
  const Specialities(
    key: 'toeic',
    title: 'TOEIC',
    id: 8,
    group: SpecialitiesGroup.testPreparation,
  ),
  const Specialities(
    key: 'english-for-kids',
    title: 'English for Kids',
    id: 3,
    group: SpecialitiesGroup.topic,
  ),
  const Specialities(
    key: 'business-english',
    title: 'Business English',
    id: 4,
    group: SpecialitiesGroup.topic,
  ),
  const Specialities(
    key: 'conversational-english',
    title: 'Conversational English',
    id: 5,
    group: SpecialitiesGroup.topic,
  ),
];

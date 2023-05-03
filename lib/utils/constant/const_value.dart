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

// class Specialities {
//   static List<TestPreparation> specialities = [
//     TestPreparation(id: 1, key: "starters", name: "STARTERS"),
//     TestPreparation(id: 2, key: "movers", name: "MOVERS"),
//     TestPreparation(id: 3, key: "flyers", name: "FLYERS"),
//     TestPreparation(id: 4, key: "ket", name: "KET"),
//     TestPreparation(id: 5, key: "pet", name: "PET"),
//     TestPreparation(id: 6, key: "ielts", name: "IELTS"),
//     TestPreparation(id: 7, key: "toefl", name: "TOEFL"),
//     TestPreparation(id: 8, key: "toeic", name: "TOEIC"),
//   ];
//   static List<LearnTopic> topics = [
//     LearnTopic(id:3, key: "english-for-kids", name: "English for Kids"),
//     LearnTopic(id:4, key: "business-english", name: "Business English"),
//     LearnTopic(id:5, key: "conversational-english", name: "Conversational English"),
//   ];
// }

enum SpecialitiesGroup {
  testPreparation("Test Preparation"),
  topic("Topic");
  final String name;
  const SpecialitiesGroup(this.name);



}

class Specialities extends Equatable {
  final id;
  final key;
  final title;
  final group;

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
    id: '1',
    group: SpecialitiesGroup.testPreparation,
  ),
  const Specialities(
    key: 'movers',
    title: 'MOVERS',
    id: '2',
    group: SpecialitiesGroup.testPreparation,
  ),
  const Specialities(
    key: 'flyers',
    title: 'FLYERS',
    id: '3',
    group: SpecialitiesGroup.testPreparation,
  ),
  const Specialities(
    key: 'ket',
    title: 'KET',
    id: '4',
    group: SpecialitiesGroup.testPreparation,
  ),
  const Specialities(
    key: 'pet',
    title: 'PET',
    id: '5',
    group: SpecialitiesGroup.testPreparation,
  ),
  const Specialities(
    key: 'ielts',
    title: 'IELTS',
    id: '6',
    group: SpecialitiesGroup.testPreparation,
  ),
  const Specialities(
    key: 'toefl',
    title: 'TOEFL',
    id: '7',
    group: SpecialitiesGroup.testPreparation,
  ),
  const Specialities(
    key: 'toeic',
    title: 'TOEIC',
    id: '8',
    group: SpecialitiesGroup.testPreparation,
  ),
  const Specialities(
    key: 'english-for-kids',
    title: 'English for Kids',
    id: '3',
    group: SpecialitiesGroup.topic,
  ),
  const Specialities(
    key: 'business-english',
    title: 'Business English',
    id: '4',
    group: SpecialitiesGroup.topic,
  ),
  const Specialities(
    key: 'conversational-english',
    title: 'Conversational English',
    id: '5',
    group: SpecialitiesGroup.topic,
  ),
];

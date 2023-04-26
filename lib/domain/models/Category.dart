import 'package:equatable/equatable.dart';

class Category extends Equatable{
  String id;
  String title;
  dynamic description;
  String key;
  dynamic displayOrder;
  String createdAt;
  String updatedAt;

  Category({
    required this.id,
    required this.title,
    required this.description,
    required this.key,
    required this.displayOrder,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'description': this.description,
      'key': this.key,
      'displayOrder': this.displayOrder,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as dynamic,
      key: map['key'] as String,
      displayOrder: map['displayOrder'] as dynamic,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, description, key, displayOrder, createdAt, updatedAt];
}
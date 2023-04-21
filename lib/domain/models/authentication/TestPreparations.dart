class TestPreparations {
  final int id;
  final String key;
  final String name;

  const TestPreparations({
    required this.id,
    required this.key,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'key': this.key,
      'name': this.name,
    };
  }

  factory TestPreparations.fromMap(Map<String, dynamic> map) {
    return TestPreparations(
      id: map['id'] as int,
      key: map['key'] as String,
      name: map['name'] as String,
    );
  }
}

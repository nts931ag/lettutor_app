class TutorCourse {
  final String userId;
  final String courseId;
  final String createdAt;
  final String updatedAt;

  const TutorCourse({
    required this.userId,
    required this.courseId,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'courseId': this.courseId,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
    };
  }

  factory TutorCourse.fromMap(Map<String, dynamic> map) {
    return TutorCourse(
      userId: map['userId'] as String,
      courseId: map['courseId'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }
}

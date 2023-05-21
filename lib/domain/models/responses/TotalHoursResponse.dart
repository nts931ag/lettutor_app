import 'package:equatable/equatable.dart';

class TotalHoursReponse extends Equatable {
  final int totalHours;



  @override
  List<Object> get props => [totalHours];

  Map<String, dynamic> toMap() {
    return {
      'total': this.totalHours,
    };
  }

  factory TotalHoursReponse.fromMap(Map<String, dynamic> map) {
    return TotalHoursReponse(
      totalHours: map['total'] as int,
    );
  }

  const TotalHoursReponse({
    required this.totalHours,
  });
}
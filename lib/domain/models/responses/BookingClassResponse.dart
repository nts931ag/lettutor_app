import 'package:equatable/equatable.dart';

class BookingClassResponse extends Equatable {
  final String? message;
  final int? statusCode;

  const BookingClassResponse({
    this.message,
    this.statusCode,
  });

  @override
  List<Object?> get props => [message, statusCode];

  Map<String, dynamic> toMap() {
    return {
      'message': this.message,
      'statusCode': this.statusCode,
    };
  }

  factory BookingClassResponse.fromMap(Map<String, dynamic> map) {
    return BookingClassResponse(
      message: map['message'] as String?,
      statusCode: map['statusCode'] as int?,
    );
  }
}

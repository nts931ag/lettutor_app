import 'package:equatable/equatable.dart';

class CancelBookingDataResponse extends Equatable {
  final String? statusCode;
  final String message;

  const CancelBookingDataResponse({
    this.statusCode,
    required this.message,
  });

  @override
  List<Object?> get props => [statusCode, message];

  Map<String, dynamic> toMap() {
    return {
      'statusCode': this.statusCode,
      'message': this.message,
    };
  }

  factory CancelBookingDataResponse.fromMap(Map<String, dynamic> map) {
    return CancelBookingDataResponse(
      statusCode: map['statusCode'] as String?,
      message: map['message'] as String,
    );
  }
}

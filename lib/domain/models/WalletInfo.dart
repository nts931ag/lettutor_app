import 'package:equatable/equatable.dart';

class WalletInfo extends Equatable {
  String id;
  String userId;
  String amount;
  bool isBlocked;
  DateTime createdAt;
  DateTime updatedAt;
  int bonus;

  WalletInfo({
    required this.id,
    required this.userId,
    required this.amount,
    required this.isBlocked,
    required this.createdAt,
    required this.updatedAt,
    required this.bonus,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'userId': this.userId,
      'amount': this.amount,
      'isBlocked': this.isBlocked,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
      'bonus': this.bonus,
    };
  }

  factory WalletInfo.fromMap(Map<String, dynamic> map) {
    return WalletInfo(
      id: map['id'] as String,
      userId: map['userId'] as String,
      amount: map['amount'] as String,
      isBlocked: map['isBlocked'] as bool,
      createdAt: DateTime.parse(map['createdAt'] as String),
      updatedAt: DateTime.parse(map['updatedAt'] as String),
      bonus: map['bonus'] as int,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, userId, amount, createdAt, updatedAt, bonus];
}

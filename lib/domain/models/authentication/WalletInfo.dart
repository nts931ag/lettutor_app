class WalletInfo {
  final String id;
  final String userId;
  final String amount;
  final bool isBlocked;
  final String createdAt;
  final String updatedAt;
  final int bonus;

  const WalletInfo({
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
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      bonus: map['bonus'] as int,
    );
  }
}
class Transaction {
  final String id;
  final TransactionType type;
  final double amount;
  final String? category;
  final DateTime date;
  final String? comment;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Transaction({
    required this.id,
    required this.type,
    required this.amount,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
    this.category,
    this.comment,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] as String,
      type: TransactionType.values.byName(json['type'] as String),
      amount: (json['amount'] as num).toDouble(),
      category: json['category'] as String?,
      date: DateTime.parse(json['date'] as String),
      comment: json['comment'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}

enum TransactionType {
  income,
  expense,
}
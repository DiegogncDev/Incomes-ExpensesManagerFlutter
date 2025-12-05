class Transaction {
  final TransactionType type;
  final double amount;
  final String description;

  Transaction({required this.amount, required this.description, required this.type});

}

enum TransactionType { income, expense}
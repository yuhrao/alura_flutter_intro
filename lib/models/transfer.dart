class Transfer {
  final int? id;
  final double amount;
  final String accountNumber;

  Transfer({this.id, required this.amount, required this.accountNumber});

  @override
  String toString() {
    return 'Transfer{id: $id, amount: $amount, accountNumber: $accountNumber}';
  }
}

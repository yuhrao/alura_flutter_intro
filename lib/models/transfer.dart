class Transfer {
  final double amount;
  final String accountNumber;

  Transfer(this.amount, this.accountNumber);

  @override
  String toString() {
    return 'Transfer{amount: $amount, accountNumber: $accountNumber}';
  }
}

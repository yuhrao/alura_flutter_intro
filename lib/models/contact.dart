class Contact {
  final int? id;
  final String name;
  final String accountNumber;
  final String accountBranch;

  Contact({this.id, required this.name, required this.accountNumber, required this.accountBranch});

  @override
  String toString() {
    return 'Contact{id: $id, name: $name, accountNumber: $accountNumber, accountBranch: $accountBranch}';
  }
}
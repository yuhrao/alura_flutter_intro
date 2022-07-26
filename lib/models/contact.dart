class Contact {
  final String name;
  final String account_number;
  final String account_branch;

  Contact(this.name, this.account_number, this.account_branch);

  @override
  String toString() {
    return 'Contact{name: $name, account_number: $account_number, account_branch: $account_branch}';
  }
}
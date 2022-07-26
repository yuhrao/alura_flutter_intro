import 'package:bytebank/database/app_db.dart';
import 'package:bytebank/models/contact.dart';

Future<Contact> saveContact(Contact contact) async {
  final db = await createDatabase();

  final Map<String, dynamic> contactMap = {};
  contactMap["full_name"] = contact.name;
  contactMap["account_branch"] = contact.accountBranch;
  contactMap["account_number"] = contact.accountNumber;

  final id = await db.insert("contact", contactMap);

  return Contact(
      id: id,
      name: contact.name,
      accountNumber: contact.accountNumber,
      accountBranch: contact.accountBranch);
}

Future<List<Contact>> listContacts() async {
  final db = await createDatabase();

  final contactMapList = await db.query("contact");
  final List<Contact> contactList = [];

  for (Map<String, dynamic> contactMap in contactMapList) {
    contactList.add(
      Contact(
        id: contactMap["id"],
        name: contactMap["full_name"],
        accountBranch: contactMap["account_branch"],
        accountNumber: contactMap["account_number"],
      ),
    );
  }

  return contactList;
}

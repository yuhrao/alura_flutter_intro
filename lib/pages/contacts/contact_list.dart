import 'package:bytebank/database/contacts.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {

  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _handleNewContact(context);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(title: const Text("Contacts")),
      body: FutureBuilder<List<Contact>>(
        future: listContacts(),
        builder:(context, snapshot) {
          debugPrint(snapshot.connectionState.toString());
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (BuildContext ctx, int idx) {
              return ContactListItem(snapshot.data![idx]);
            },
          );
        },
      ),
    );
  }

  _handleNewContact(BuildContext context) {
    Navigator.of(context).pushNamed("/contacts/new");
  }
}

class ContactListItem extends StatelessWidget {
  final Contact contact;

  const ContactListItem(this.contact, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w800),
        ),
        subtitle: Text(
            "Branch: ${contact.accountBranch} Number: ${contact.accountNumber}",
            style: const TextStyle(color: Colors.grey)),
      ),
    );
  }
}

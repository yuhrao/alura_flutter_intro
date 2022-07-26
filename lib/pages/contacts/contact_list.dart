import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  final List<Contact> _contacts = <Contact>[];

    ContactsList({Key? key}) : super(key: key);

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  Future<void> _handleNewContact(BuildContext context) async{
    final result = await Navigator.of(context).pushNamed("/contacts/new");
    final newContact = result as Contact;

    setState(() {
      widget._contacts.add(newContact);
    });
  }
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
      body: ListView.builder(
        itemCount: widget._contacts.length,
        itemBuilder: (BuildContext ctx, int idx) {
          return ContactListItem(widget._contacts[idx]);
        },
      ),
    );
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

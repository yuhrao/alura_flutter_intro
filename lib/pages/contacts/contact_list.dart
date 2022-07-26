import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  final List<Contact> _contacts = <Contact>[
    Contact("Pedrinho", "0001", "01010101-1"),
    Contact("Pedrinho", "0001", "01010101-1"),
    Contact("Pedrinho", "0001", "01010101-1"),
    Contact("Pedrinho", "0001", "01010101-1"),
  ];

    ContactsList({Key? key}) : super(key: key);

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/contacts/new");
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
            "Branch: ${contact.account_branch} Number: ${contact.account_number}",
            style: const TextStyle(color: Colors.grey)),
      ),
    );
  }
}

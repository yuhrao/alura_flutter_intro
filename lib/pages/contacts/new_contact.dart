import 'package:flutter/material.dart';

class NewContactForm extends StatelessWidget {
  const NewContactForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Contact")),
      body: Text("new contact"),
    );
  }
}

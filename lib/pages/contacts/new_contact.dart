import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class NewContactForm extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController accountBranchController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Contact")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controller: fullNameController,
              label: "Full Name",
              placeholder: "John Doe",
            ),
            Editor(
              controller: accountBranchController,
              label: "Account Branch Number",
              placeholder: "0001",
              keyboardType: TextInputType.number,
            ),
            Editor(
              controller: accountNumberController,
              label: "Account Number",
              placeholder: "123123123-12",
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () => _createContact(context),
                  child: const Text("Confirm"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showErrorSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).errorColor,
          content: Text(text),
        ),
      );
  }

  _createContact(BuildContext context) {
    final String fullName = fullNameController.value.text;
    final String accountBranchNumber = accountBranchController.value.text;
    final String accountNumber = accountNumberController.value.text;

    if (fullName.isEmpty) {
      _showErrorSnackbar(context, "Full name must be provided");
      return;
    }

    if (accountBranchNumber.isEmpty) {
      _showErrorSnackbar(context, "Account branch must be provided");
      return;
    }

    if (accountNumber.isEmpty) {
      _showErrorSnackbar(context, "Account number must be provided");
      return;
    }

    Navigator.of(context).pop(Contact(fullName, accountBranchNumber, accountNumber));
  }

}

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? placeholder;
  final Icon? icon;
  final TextInputType? keyboardType;

  const Editor({
    required this.controller,
    required this.label,
    this.placeholder,
    this.icon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 24.0),
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
          icon: icon,
          labelText: label,
          hintText: placeholder,
        ),
      ),
    );
  }
}

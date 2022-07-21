import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

class NewTransferForm extends StatelessWidget {
  final TextEditingController _accountNumberFieldController =
  TextEditingController();
  final TextEditingController _amountFieldController = TextEditingController();

  NewTransferForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New transaction"),
      ),
      body: Column(
        children: [
          Editor(
            controller: _accountNumberFieldController,
            label: "Account Number",
            placeholder: "0000",
          ),
          Editor(
            controller: _amountFieldController,
            label: "Amount",
            placeholder: "1.23",
            icon: const Icon(Icons.monetization_on),
          ),
          ElevatedButton(
            onPressed: () => _createTransfer(context),
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final double? amount =
    double.tryParse(_amountFieldController.text);
    final String accountNumber = _accountNumberFieldController.text;
    if (amount == null && accountNumber.length <= 0) return;

    final transfer = Transfer(amount ?? 0, accountNumber);
    Navigator.pop(context, transfer);
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? placeholder;
  final Icon? icon;

  Editor(
      {required this.controller, required this.label, this.placeholder, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 24.0),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          icon: icon,
          labelText: label,
          hintText: placeholder,
        ),
      ),
    );
  }
}

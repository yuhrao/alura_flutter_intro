import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/pages/transfer_form.dart';
import 'package:flutter/material.dart';

class TransfersList extends StatelessWidget {
  const TransfersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All transfers"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return NewTransferForm();
          }));
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          TransferListItem(Transfer(100, "10000")),
          TransferListItem(Transfer(200, "20000")),
          TransferListItem(Transfer(300, "30000")),
          TransferListItem(Transfer(400, "40000")),
        ],
      ),
    );
  }
}

class TransferListItem extends StatelessWidget {
  final Transfer _transfer;

  TransferListItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text("R\$${_transfer.amount.toStringAsFixed(2)}"),
        subtitle: Text(_transfer.accountNumber),
      ),
    );
  }
}

import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/pages/transfer_form.dart';
import 'package:flutter/material.dart';

class TransfersList extends StatefulWidget {
  final List<Transfer> _transfers = <Transfer>[];

  TransfersList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TransfersListState();
  }
}

class TransfersListState extends State<TransfersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All transfers"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transfer?> future = Navigator.push<Transfer>(context,
              MaterialPageRoute(builder: (context) {
            return NewTransferForm();
          }));

          future.then((newTransfer) {
            setState(() {
              widget._transfers.add(newTransfer ?? Transfer(10, "1222"));
            });
          });
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (BuildContext context, int index) {
          return TransferListItem(widget._transfers[index]);
        },
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

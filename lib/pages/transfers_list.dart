import 'package:bytebank/models/transfer.dart';
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

  Future<void> _goToNewTransferForm (BuildContext context) async{
    final newTransfer = await Navigator.of(context).pushNamed("/transfers/new");

    if (newTransfer != null){
      setState(() {
        widget._transfers.add(newTransfer as Transfer);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All transfers"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _goToNewTransferForm(context);
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

  const TransferListItem(this._transfer, {Key? key}) : super(key: key);

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

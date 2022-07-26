import 'package:bytebank/pages/contact_list.dart';
import 'package:bytebank/pages/dashboard.dart';
import 'package:bytebank/pages/transfer_form.dart';
import 'package:bytebank/pages/transfers_list.dart';
import 'package:flutter/material.dart';

final routes = <String, WidgetBuilder>{
  "/": (context){
    return Dashboard();
  },
  "/contacts": (context){
    return ContactsList();
  },
  "/transfers": (context){
    return TransfersList();
  },
  "/transfers/new": (context){
    return NewTransferForm();
  }
};
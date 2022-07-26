import 'package:bytebank/pages/contacts/contact_list.dart';
import 'package:bytebank/pages/contacts/new_contact.dart';
import 'package:bytebank/pages/dashboard.dart';
import 'package:bytebank/pages/transfers/transfer_form.dart';
import 'package:bytebank/pages/transfers/transfers_list.dart';
import 'package:flutter/material.dart';

final routes = <String, WidgetBuilder>{
  "/": (context){
    return Dashboard();
  },
  "/contacts": (context){
    return ContactsList();
  },
  "/contacts/new": (context){
    return NewContactForm();
  },
  "/transfers": (context){
    return TransfersList();
  },
  "/transfers/new": (context){
    return NewTransferForm();
  }
};
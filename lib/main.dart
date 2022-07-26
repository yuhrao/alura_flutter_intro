import 'package:bytebank/database/contacts.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/routes.dart';
import 'package:bytebank/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  saveContact(Contact(
          name: "Alex", accountNumber: "Test123", accountBranch: "123123-12"))
      .then((value) {
    debugPrint(value.toString());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: "/",
    );
  }
}

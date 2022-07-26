import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/bytebank_logo.png"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              DashboardItem(
                title: "Contacts",
                iconData: Icons.people,
                navigateTo: "/contacts",
              ),
              DashboardItem(
                title: "Transfers",
                iconData: Icons.currency_exchange,
                navigateTo: "/transfers",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final IconData? iconData;
  final String title;
  final String? navigateTo;

  const DashboardItem({this.iconData, required this.title, this.navigateTo, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgets = List<Widget>.empty(growable: true);

    if (iconData != null) {
      widgets.add(
        Icon(
          iconData,
          color: Colors.white,
          size: 32.0,
        ),
      );
    }
    widgets.add(
      Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
    );

    return Material(
      color: Theme.of(context).primaryColor,
      child: InkWell(
        onTap: (){
          if (navigateTo != null){
            Navigator.of(context).pushNamed(navigateTo!);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            height: 100,
            width: 150,
            child: Column(
              mainAxisAlignment: iconData != null
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: widgets,
            ),
          ),
        ),
      ),
    );
  }
}

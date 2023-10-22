import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Chip(
        labelPadding: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        color: MaterialStatePropertyAll(Colors.black),
        avatar: Icon(
          FluentIcons.arrow_shuffle_20_filled,
          size: 25,
          color: Colors.yellow,
        ),
        label: Text(
          "Random",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )),
    );
  }
}

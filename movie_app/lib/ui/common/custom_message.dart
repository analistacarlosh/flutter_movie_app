import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomMessage extends StatelessWidget {
  CustomMessage({@required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        key: Key('custom_message'),
        child: Text(title),
      ),
    );
  }
}

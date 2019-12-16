import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomMessage extends StatelessWidget {
  const CustomMessage({@required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        key: const Key('custom_message'),
        child: Text(title),
      ),
    );
  }
}

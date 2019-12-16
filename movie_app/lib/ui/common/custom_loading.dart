import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return Center(
          key: const ValueKey('ios_loadingIndicator'),
          child: CupertinoActivityIndicator()
      );
    }
    return Center(
        key: const ValueKey('android_loadingIndicator'),
        child: const CircularProgressIndicator()
    );
  }
}

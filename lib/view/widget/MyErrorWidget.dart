import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  final String msg;

  MyErrorWidget(this.msg);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: Text(
      '$msg',
    )));
  }
}
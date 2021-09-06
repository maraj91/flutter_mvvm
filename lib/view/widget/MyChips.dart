import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyChips extends StatelessWidget {
  final label;
  final Color color;
  MyChips(this.label,this.color);
  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: EdgeInsets.all(2.0),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(8.0),
    );
  }
}

import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        'hey',
      ),
      value: false,
      onChanged: (bool status) {
        status = true;
      },
    );
  }
}
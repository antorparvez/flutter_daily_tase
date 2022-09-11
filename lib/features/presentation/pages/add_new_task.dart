
import 'package:flutter/material.dart';

class AddNewTask extends StatelessWidget {
  const AddNewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new Task"),
      ),
      body: Center(
        child: Text(
          "Add new task"
        ),
      ),

    );
  }
}

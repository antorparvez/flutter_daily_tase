import 'package:flutter/material.dart';

class CompeteTaskPage extends StatelessWidget {
  const CompeteTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Complete"),
      ),
      body: Center(
        child: Text("Completed task"),
      ),
    );
  }
}

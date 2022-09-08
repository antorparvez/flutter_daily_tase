import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Daily Task',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Daily Task'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello Flutter'),
          ),
        ),
      ),
    );
  }
}

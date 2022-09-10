import 'package:flutter/material.dart';
import 'package:my_daily_tase/features/presentation/di/di_container.dart' as sl;

void main() async {
  sl.initDI();
  runApp(MyApp());
}

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
            child: Text('Hello Flutter by antor'),
          ),
        ),
      ),
    );
  }
}

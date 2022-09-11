import 'package:flutter/material.dart';
import 'package:my_daily_tase/features/presentation/di/di_container.dart' as sl;
import 'package:my_daily_tase/features/presentation/screen/home_screen.dart';

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
      theme: ThemeData(
        primaryColor: Colors.indigoAccent,
      ),
      routes: {
        "/": (context) {
          return HomeScreen();
        }
      },
    );
  }
}

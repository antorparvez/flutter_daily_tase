import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_daily_tase/features/presentation/common/on_generate_route.dart';
import 'package:my_daily_tase/features/presentation/cubit/task_cubit.dart';
import 'package:my_daily_tase/features/presentation/di/di_container.dart' as di;
import 'package:my_daily_tase/features/presentation/screen/home_screen.dart';

void main() async {
  await di.initDI();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => di.sl<TaskCubit>()..openDatabaseUseCase(),
      child: MaterialApp(
        title: 'My Daily Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.indigoAccent,
        ),
        onGenerateRoute: OnGenerateRoute.route,
        routes: {
          "/": (context) {
            return HomeScreen();
          }
        },
      ),
    );
  }
}

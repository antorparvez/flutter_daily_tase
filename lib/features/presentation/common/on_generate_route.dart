import 'package:flutter/material.dart';
import 'package:my_daily_tase/features/presentation/common/Constants.dart';

import '../pages/add_new_task.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case PageConstants.addTaskPageConst:
        {
          return materialBuilder(widget: const AddNewTask());
        }
      default:
        return materialBuilder(
          widget: const ErrorPage(),
        );
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("error"),
      ),
      body: const Center(
        child: Text("error"),
      ),
    );
  }
}

MaterialPageRoute materialBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}

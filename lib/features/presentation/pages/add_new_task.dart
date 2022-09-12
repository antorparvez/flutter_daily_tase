import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:my_daily_tase/features/domain/entities/task_entity.dart';
import 'package:my_daily_tase/features/presentation/cubit/task_cubit.dart';
import 'package:my_daily_tase/features/presentation/widgets/common.dart';

import '../widgets/theme/style.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({Key? key}) : super(key: key);

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final TextEditingController _textEditingController = TextEditingController();
  int _selectedTaskTypeIndex = 0;
  DateTime _selectedTime = DateTime.now();

  Future<Null> _selectTime() async {
    final TimeOfDay? picked_s = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        });

    if (picked_s != null &&
        picked_s !=
            TimeOfDay(hour: _selectedTime.hour, minute: _selectedTime.minute))
      setState(() {
        _selectedTime = DateTime(_selectedTime.year, _selectedTime.month,
            _selectedTime.day, picked_s.hour, picked_s.minute);
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add new Task"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _addNewTaskWidget(),
                _divider(),
                _taskTypeListWidget(),
                _divider(),
                _selectTimeWidget(),
                _addTaskButtonWidget(),
              ],
            ),
          ),
        ));
  }

  _addNewTaskWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: Colors.blueGrey.withOpacity(.2)),
      child: Scrollbar(
        thickness: 6,
        child: TextField(
          controller: _textEditingController,
          maxLines: 4,
          decoration: const InputDecoration(hintText: "e.g morning task"),
        ),
      ),
    );
  }

  _divider() {
    return Column(
      children: const [
        SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 1.5,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  _taskTypeListWidget() {
    return Container(
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: taskTypeList.map((name) {
          var index = taskTypeList.indexOf(name);

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedTaskTypeIndex = index;
              });
            },
            child: _selectedTaskTypeIndex == index
                ? Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: taskTypeListColor[index],
                      ),
                      child: Center(
                        child: Text(
                          name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: taskTypeListColor[index],
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          name,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
          );
        }).toList(),
      ),
    );
  }

  _selectTimeWidget() {
    return GestureDetector(
      onTap: () {
        _selectTime();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Choose Time...",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
              "${DateFormat("hh:mm a").format(DateTime.now())} - ${DateFormat("hh:mm a").format(_selectedTime)}"),
        ],
      ),
    );
  }

  _addTaskButtonWidget() {
    return Expanded(
      child: GestureDetector(
        // onTap: submitNewTask,
        onTap: summitNewTask,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 50,
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(colors: [
                Colors.indigo,
                color6FADE4,
              ], end: Alignment.topLeft, begin: Alignment.topRight),
            ),
            child: Text(
              "Add task",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }

  void summitNewTask() {
    if (_textEditingController.text.isEmpty) {
      showToastMsg("Please write something");
      return;
    } else {
      BlocProvider.of<TaskCubit>(context).addNewTaskCubit(
          taskEntity: TaskEntity(
        title: _textEditingController.text.toString(),
        time: _selectedTime.toString(),
        isCompletedTask: false,
        isNotification: false,
        colorID: _selectedTaskTypeIndex,
        taskType: taskTypeList[_selectedTaskTypeIndex],
      ));
      showToastMsg("New task saved");
    }
  }

  void showToastMsg(String text) {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pop(context);
      Fluttertoast.showToast(
        msg: text,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
      );
    });
  }
}

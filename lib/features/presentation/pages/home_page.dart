import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../widgets/common.dart';
import '../widgets/theme/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SlidableController _slideController = SlidableController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [_headerWidget(), _listTaskWidget()],
    ));
  }

  _headerWidget() {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.indigo,
            color6FADE4,
          ],
          end: Alignment.topLeft,
          begin: Alignment.topRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "My Daily Tasks",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Today you have 0 task",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ],
                ),
                PopupMenuButton<String>(
                  itemBuilder: (_) => taskTypeList.map((value) {
                    return PopupMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onSelected: (String value) {
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.filter_list_outlined,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          _currentTaskWidget(),
        ],
      ),
    );
  }

  _currentTaskWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Colors.white.withOpacity(.3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Today Reminder",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "This the task title",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                DateFormat("hh:mm a").format(DateTime.now()),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          Container(
              child: const Icon(
            Icons.notifications,
            size: 100,
            color: Colors.yellow,
          )),
        ],
      ),
    );
  }

  _listTaskWidget() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) {
          return _listItem();
        },
      ),
    );
  }

  _listItem() {
    return Slidable(
      controller: _slideController,
      actionExtentRatio: .25,
      enabled: true,
      closeOnScroll: true,
      secondaryActions: [
        GestureDetector(
          onTap: () {},
          child: FittedBox(
            child: Container(
              height: 20,
              width: 20,
              margin: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 10,
              ),
            ),
          ),
        ),
      ],
      actionPane: const SlidableDrawerActionPane(),
      child: Container(
        height: 70,
        margin: const EdgeInsets.only(left: 10, bottom: 1),
        child: GestureDetector(
          onTap: () {
            _actionDialog();
          },
          child: Card(
            elevation: 3,
            /*       shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),*/
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 4,
                  decoration: BoxDecoration(
                      color: taskTypeListColor[2],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8))),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(40),
                        ),
                        border: Border.all(color: Colors.green)),
                    child: const Icon(
                      Icons.notifications_active,
                      color: Colors.green,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  DateFormat("hh:mm a").format(DateTime.now()),
                  style: TextStyle(color: Colors.black.withOpacity(.4)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                    width: MediaQuery.of(context).size.width / 2.1,
                    child: const Text(
                      "sfddsafdasdafsf",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.lineThrough),
                    )),
                GestureDetector(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Icon(
                      FontAwesome.bell,
                      color: Colors.deepOrange,
                      size: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _actionDialog() {
    AwesomeDialog(
      context: context,
      borderSide: BorderSide(color: taskTypeListColor[2], width: 4),
      width: 400,
      buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
      headerAnimationLoop: true,
      animType: AnimType.SCALE,
      title: 'Title',
      desc: "asdfasdfasd",
      showCloseIcon: false,
      dialogType: DialogType.SUCCES,
      /*  customHeader: Container(
        child: Text("sdfadffsed"),
      ),*/
      btnOkOnPress: () {},
    ).show();
  }
}

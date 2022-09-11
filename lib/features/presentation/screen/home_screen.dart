import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_daily_tase/features/presentation/common/Constants.dart';
import 'package:my_daily_tase/features/presentation/pages/home_page.dart';

import '../pages/complete_task_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;

  List<Widget> get _pages => [HomePage(), CompeteTaskPage()];
  final iconList = <IconData>[Icons.home, Icons.task];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            size: 40,
            color: Colors.pink,
          ),
          onPressed: () {
            Navigator.pushNamed(context, PageConstants.addTaskPageConst);
          }),
      body: _pages[activeIndex],
    );
  }

  Widget _bottomNavBar() {
    return AnimatedBottomNavigationBar(
      icons: iconList,
      activeIndex: activeIndex,
      gapLocation: GapLocation.center,
      inactiveColor: Colors.blueGrey,
      activeColor: Colors.pink,
      onTap: (index) {
        setState(() {
          activeIndex = index;
        });
      },
    );
    /*  return  AnimatedBottomNavigationBar.builder(
      itemCount: iconList.length,
      tabBuilder: (int index, bool isActive) {
        final color = isActive ? HexColor('#FFA400') : Colors.white;
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconList[index],
              size: 24,
              color: color,
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "brightness $index",
                maxLines: 1,
                style: TextStyle(color: color),
               // group: autoSizeGroup,
              ),
            )
          ],
        );
      },
      backgroundColor: HexColor('#373A36'),
      activeIndex: activeIndex,
      splashColor: HexColor('#4875b3'),
     // notchAndCornersAnimation: borderRadiusAnimation,
      splashSpeedInMilliseconds: 300,
      notchSmoothness: NotchSmoothness.defaultEdge,
      gapLocation: GapLocation.center,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: (index) => setState(() => activeIndex = index),
     // hideAnimationController: _hideBottomBarAnimationController,
      shadow: BoxShadow(
        offset: Offset(0, 1),
        blurRadius: 12,
        spreadRadius: 0.5,
        color: HexColor('#FFA400'),
      ),);*/
  }
}

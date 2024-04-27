import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/constants.dart';
import '../helpers/global_variables.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 70,
      color: primaryGreen,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
                setState(() {
                  GlobalVariables.mainScreenPageIndex = 0;
                  GlobalVariables.pageController.animateToPage(0, duration: const Duration(milliseconds: 400), curve: Curves.linearToEaseOut);
                });
                },
              icon: const Icon(Icons.home_outlined, size: 30, color: Colors.white,)
          ),
          IconButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
                setState(() {
                  GlobalVariables.mainScreenPageIndex = 1;
                  GlobalVariables.pageController.animateToPage(1, duration: const Duration(milliseconds: 400), curve: Curves.linearToEaseOut);
                });
              },
              icon: const Icon(Icons.favorite_border_rounded, size: 30, color: Colors.white,)
          ),
          IconButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
                setState(() {
                  GlobalVariables.mainScreenPageIndex = 2;
                  GlobalVariables.pageController.animateToPage(2, duration: const Duration(milliseconds: 400), curve: Curves.linearToEaseOut);
                });
              },
              icon: const Icon(CupertinoIcons.person_circle, size: 30, color: Colors.white,)
          )
        ],
      ),
    );
  }
}

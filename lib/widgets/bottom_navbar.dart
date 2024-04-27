import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 70,
      color: primaryGreen,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
              icon: const Icon(Icons.home_outlined, size: 30, color: Colors.white,)
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_rounded, size: 30, color: Colors.white,)
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.person_circle, size: 30, color: Colors.white,)
          )
        ],
      ),
    );
  }
}

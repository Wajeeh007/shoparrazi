import 'package:flutter/material.dart';
import 'package:shoparrazi/helpers/global_variables.dart';
import 'package:shoparrazi/screens/account_management/account_management_view.dart';
import 'package:shoparrazi/screens/home/home_view.dart';
import 'package:shoparrazi/widgets/bottom_navbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            GlobalVariables.mainScreenPageIndex = value;
          });
        },
        controller: GlobalVariables.pageController,
        children: [
          const HomeView(),
          Container(),
          const AccountManagementView()
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoparrazi/helpers/constants.dart';
import 'package:shoparrazi/screens/home_view.dart';
import 'package:shoparrazi/widgets/bottom_navbar.dart';
import 'package:shoparrazi/widgets/textfields.dart';
import 'package:shoparrazi/widgets/top_container.dart';

class AppBarBottomNavBarView extends StatelessWidget {
  const AppBarBottomNavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TopContainer(
        topChildren: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Hi, Good Evening', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_cart_outlined, size: 25, color: Colors.white,)
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text('Let\'s search your grocery items.', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 20, left: 15, right: 15),
                  child: RoundedRectTextField(
                    hintText: 'Search grocery items',
                    prefixIcon: Icons.search_rounded,
                  ),
                ),
        ],
          bottomChild:
            Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15),),
                    color: Colors.white
                  ),
                  child: PageView(
                    controller: PageController(),
                    children: [
                      const HomeView(),
                    ],
                  )
                ),
              )
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
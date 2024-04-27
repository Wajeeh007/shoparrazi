import 'package:flutter/material.dart';
import 'package:shoparrazi/screens/cart/cart_view.dart';
import '../helpers/constants.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({
    super.key,
    this.textTitle,
    this.bottomHeadingText,
    this.topChildren,
    required this.bottomChild,
    this.includeCartIcon,
    this.containerBackGround = primaryDullGreen,
    this.includeBackIcon
  });

  /*
    USAGE:
      1: If declaring topChildren, bottomHeading and textTitle will not work
      2: bottomChild is required
  */

  final String? textTitle;
  final String? bottomHeadingText;
  final List<Widget>? topChildren;
  final Widget? bottomChild;
  final Color containerBackGround;
  final bool? includeCartIcon;
  final bool? includeBackIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: containerBackGround),
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: topChildren ?? [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textTitle == null ? includeBackIcon != false ? InkWell(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 22,
                              color: Colors.white,
                            )
                        ) : const SizedBox(height: 35,) : Text(
                            textTitle!,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white
                            )
                        ),
                        includeCartIcon != false ? IconButton(
                            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const CartView())),
                            icon: const Icon(Icons.shopping_cart_outlined, size: 22,
                              color: Colors.white,)
                        ) :  const SizedBox()
                      ],
                    ),
                  ),
                  bottomHeadingText == null ? const SizedBox(height: 20,) : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: Text(
                        bottomHeadingText!,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ]
            ),
            bottomChild!,
          ],
        )
    );
  }
}
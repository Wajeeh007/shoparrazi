import 'package:flutter/material.dart';
import '../helpers/constants.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({
    super.key,
    this.textTitle,
    this.bottomHeadingText,
    this.topChildren,
    this.onBackIconPressed,
    this.onCartIconPressed,
    required this.bottomChild,
    this.containerBackGround = primaryDullGreen,
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
  final VoidCallback? onBackIconPressed;
  final VoidCallback? onCartIconPressed;
  final Color containerBackGround;

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
                        textTitle == null ? IconButton(
                            onPressed: onBackIconPressed, icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 22, color: Colors.white,)
                        ) : Text(textTitle!, style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white
                        )
                        ),
                        IconButton(
                            onPressed: onCartIconPressed,
                            icon: const Icon(Icons.shopping_cart_outlined, size: 22,
                              color: Colors.white,)
                        )
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
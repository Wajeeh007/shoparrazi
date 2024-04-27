import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key, required this.child, this.color, this.padding});

  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
            color: color ?? Colors.white,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
        ),
        child: child,
      ),
    );
  }
}

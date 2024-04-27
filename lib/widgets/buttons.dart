import 'package:flutter/material.dart';

import '../helpers/constants.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.onPressed,
    this.title = '',
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.child,
  });

  final VoidCallback onPressed;
  final String title;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: MaterialButton(
        elevation: 0,
        height: height ?? 50,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 30),
          side: const BorderSide(
            color: primaryGreen,
            width: 0.7
          )
        ),
        onPressed: onPressed,
        color: backgroundColor ?? primaryGreen,
        minWidth: width ?? MediaQuery.of(context).size.width,
        child: child ?? Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}

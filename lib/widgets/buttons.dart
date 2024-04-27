import 'package:flutter/material.dart';

import '../helpers/constants.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.onPressed, required this.title});

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: MaterialButton(
        elevation: 0,
        height: 50,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
        ),
        onPressed: onPressed,
        color: primaryGreen,
        minWidth: MediaQuery.of(context).size.width,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

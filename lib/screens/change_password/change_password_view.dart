import 'package:flutter/material.dart';
import 'package:shoparrazi/helpers/constants.dart';
import 'package:shoparrazi/widgets/buttons.dart';
import 'package:shoparrazi/widgets/textfields.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryLightGreen,
        body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 35.0, left: 15, right: 15, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back_ios_rounded, size: 25, color: Colors.black,),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.25,),
              child: Center(
                child: Text(
                  'Change Password',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: textBlack
                  ),
                ),
              ),
            ),
            const TextFieldWithoutTitle(
              hintText: 'Enter Old Password',
              borderRadius: 30,
              contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              borderColor: primaryGreen,
              fillColor: Colors.white,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 25.0),
              child: TextFieldWithoutTitle(
                contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                hintText: 'Enter New Password',
                borderRadius: 30,
                borderColor: primaryGreen,
                fillColor: Colors.white,
              ),
            ),
            MainButton(onPressed: () => Navigator.pop(context), title: 'Done',)
          ],
        ),
      ),
    );
  }
}

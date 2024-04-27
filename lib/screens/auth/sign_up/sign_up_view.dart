import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoparrazi/helpers/constants.dart';
import 'package:shoparrazi/widgets/buttons.dart';
import '../../../widgets/textfields.dart';
import '../../main_screen/main_screen_view.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryLightGreen,
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 15, right: 15, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 25)
                ),
              ),
              Text('Sign Up', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: textBlack),),
              Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 35),
                child: Text(
                  'Write Your Information Below',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade700
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 45.0),
                child: TextFieldWithoutTitle(
                  hintText: 'Username',
                  prefixIcon: CupertinoIcons.person_circle,
                  contentPadding: EdgeInsets.symmetric( vertical: 15),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.05),
                child: const TextFieldWithoutTitle(
                  hintText: 'Email',
                  prefixIcon: Icons.email_outlined,
                  contentPadding: EdgeInsets.symmetric( vertical: 15),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TextFieldWithoutTitle(
                  hintText: 'Password',
                  prefixIcon: Icons.lock_outline_rounded,
                  contentPadding: EdgeInsets.symmetric( vertical: 15),
                ),
              ),
              MainButton(onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => const MainScreen()), (route) => false), title: 'Sign Up'),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('You have an account? ', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: textBlack),),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      splashFactory: NoSplash.splashFactory,
                      child: Text(
                        'Sign In',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: textBlack,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
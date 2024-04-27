import 'package:flutter/material.dart';
import 'package:shoparrazi/helpers/constants.dart';
import 'package:shoparrazi/screens/auth/sign_up/sign_up_view.dart';
import 'package:shoparrazi/screens/main_screen/main_screen_view.dart';
import 'package:shoparrazi/widgets/buttons.dart';
import 'package:shoparrazi/widgets/textfields.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryLightGreen,
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/shopping_cart.png', height: 100, width: 100,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: textBlack
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(margin: const EdgeInsets.only(bottom: 25), width: 100, height: 5, decoration: BoxDecoration(color: primaryGreen, borderRadius: BorderRadius.circular(5)),),
              Text(
                'Sign in to continue',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: textBlack
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 45.0),
                child: TextFieldWithoutTitle(
                  hintText: 'Enter Email',
                  prefixIcon: Icons.email_outlined,
                  contentPadding: EdgeInsets.symmetric( vertical: 15),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30.0, bottom: 15),
                child: TextFieldWithoutTitle(
                  hintText: 'Enter Password',
                  prefixIcon: Icons.lock_outline_rounded,
                  contentPadding: EdgeInsets.symmetric( vertical: 15),
                ),
              ),
              MainButton(
                  onPressed: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => const MainScreen()), (route) => false),
                  title: 'Login'),
              Align(
                alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const SignUpView())),
                      child: Text(
                        'Forgot Password?',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: textBlack, fontWeight: FontWeight.w600),
                      ),
                  ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('You don\'t have an account? ', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: textBlack),),
                  InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const SignUpView())),
                      splashFactory: NoSplash.splashFactory,
                      child: Text(
                        'Sign Up',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: textBlack,
                            fontWeight: FontWeight.w600),
                      ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
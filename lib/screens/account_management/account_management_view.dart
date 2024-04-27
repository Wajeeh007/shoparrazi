import 'package:flutter/material.dart';
import 'package:shoparrazi/helpers/constants.dart';
import 'package:shoparrazi/screens/auth/login/login_view.dart';
import 'package:shoparrazi/screens/change_currency/change_currency_view.dart';
import 'package:shoparrazi/screens/change_password/change_password_view.dart';
import 'package:shoparrazi/widgets/bottom_container.dart';
import 'package:shoparrazi/widgets/buttons.dart';
import 'package:shoparrazi/widgets/top_container.dart';

class AccountManagementView extends StatelessWidget {
  const AccountManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return TopContainer(
      includeBackIcon: false,
      includeCartIcon: false,
      bottomHeadingText: 'Account Management',
      bottomChild: BottomContainer(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 15, right: 15, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              optionTile(context, title: 'Change Currency', icon: Icons.currency_exchange_rounded, onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const ChangeCurrencyView()))),
              optionTile(context, title: 'Change Password', icon: Icons.password_rounded, onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const ChangePasswordView()))),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    optionTile(
                    context,
                    title: 'Logout',
                    icon: Icons.logout_rounded,
                    onPressed: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => const LoginView()),
                            (route) => false)
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
  
  Widget optionTile(BuildContext context, {required String title, required IconData icon, required VoidCallback onPressed}) {
    return MainButton(
      borderRadius: 15,
      backgroundColor: Colors.white,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  // Icons.currency_exchange_rounded,
                  size: 23,
                  color: Colors.black,
                ),
                const SizedBox(width: 15,),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: primaryGreen,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 23,
              color: primaryGreen,
            )
          ],
        ),
      ),
    );
  }
}

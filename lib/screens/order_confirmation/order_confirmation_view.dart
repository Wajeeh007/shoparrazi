import 'package:flutter/material.dart';
import 'package:shoparrazi/helpers/constants.dart';
import 'package:shoparrazi/widgets/bottom_container.dart';
import 'package:shoparrazi/widgets/buttons.dart';
import 'package:shoparrazi/widgets/top_container.dart';

class OrderConfirmationView extends StatelessWidget {
  const OrderConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    return TopContainer(
      includeCartIcon: false,
      bottomHeadingText: 'Thank You',
      bottomChild: BottomContainer(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0, top: 25, left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Your order has been placed. You will receive an email receipt shortly',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: textBlack, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.08),
                child: Image.asset('assets/images/order_confirmation.png'),
              ),
              MainButton(
                  onPressed: () => Navigator.pop(context),
                  title: 'Back to Home',
                width: 150,
                borderRadius: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}

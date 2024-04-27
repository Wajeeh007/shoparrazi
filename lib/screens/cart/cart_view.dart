import 'package:flutter/material.dart';
import 'package:shoparrazi/helpers/constants.dart';
import 'package:shoparrazi/screens/checkout/checkout_view.dart';
import 'package:shoparrazi/widgets/bottom_container.dart';
import 'package:shoparrazi/widgets/buttons.dart';
import 'package:shoparrazi/widgets/cart_item.dart';
import 'package:shoparrazi/widgets/top_container.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TopContainer(
        includeCartIcon: false,
        bottomHeadingText: 'Cart',
          bottomChild: BottomContainer(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return CartItem(index: index);
              },
            ),
          )
      ),
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height * 0.13,
        color: primaryGreen,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Amount',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white
                    ),
                  ),
                  Text(
                    '950 Rs',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: MainButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const CheckoutView())),
                  title: 'Checkout',
                borderRadius: 15,
                textColor: primaryGreen,
                backgroundColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

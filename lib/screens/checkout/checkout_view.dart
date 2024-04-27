import 'package:flutter/material.dart';
import 'package:shoparrazi/screens/order_confirmation/order_confirmation_view.dart';
import 'package:shoparrazi/widgets/bottom_container.dart';
import 'package:shoparrazi/widgets/textfields.dart';
import 'package:shoparrazi/widgets/top_container.dart';
import '../../helpers/constants.dart';
import '../../widgets/buttons.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {

  String radioValue = 'Visa Card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TopContainer(
        includeCartIcon: false,
        bottomHeadingText: 'Check Out',
        bottomChild: BottomContainer(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                addressAndCardContainer(
                  child: const Column(
                    children: [
                      TextFieldWithTitle(
                        title: 'Address',
                        hintText: 'Street No 1, New York. USA',
                        fillColor: textFieldFillGrey,
                      ),
                      SizedBox(height: 25,),
                      Row(
                        children: [
                          Expanded(
                            child: TextFieldWithTitle(
                              title: 'State/Province',
                              hintText: 'NK',
                              fillColor: textFieldFillGrey,
                            ),
                          ),
                          SizedBox(width: 15,),
                          Expanded(
                            child: TextFieldWithTitle(
                              title: 'Zip Code',
                              hintText: '123456',
                              fillColor: textFieldFillGrey,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ),
                addressAndCardContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Payment:',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: textBlack
                          ),
                        ),
                      ),
                      const SizedBox(height: 12,),
                      radioBtn(title: 'Visa Card', image: 'assets/images/visa.png'),
                      radioBtn(title: 'Mastercard', image: 'assets/images/mastercard.png'),
                      radioBtn(title: 'Cash on Delivery', image: 'assets/images/cash_on_delivery.png'),
                    ],
                  )
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: primaryGreen,
        height: MediaQuery.of(context).size.height * 0.13,
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
                onPressed: () {
                  if(radioValue == 'Cash on Delivery') {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => const OrderConfirmationView()), (route) => route.isFirst);
                  } else {
                    addCardBottomSheet();
                  }
                },
                title: 'Continue',
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

  Widget addressAndCardContainer({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: primaryTextGrey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
        ),
        child: child,
      ),
    );
  }

  Widget radioBtn({
    required String title,
    required String image,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Radio(
              value: title,
              groupValue: radioValue,
              onChanged: (value) => setState(() => radioValue = value!),
            fillColor: MaterialStateProperty.resolveWith((states) => primaryGreen),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: textBlack,
                ),
              ),
              Image.asset(image, width: 25, height: 25,)
            ],
          )
        ],
      ),
    );
  }

  Future addCardBottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15))
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Add Your Card',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: textBlack, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20,),
                  const RoundedRectTextField(
                    hintText: 'Enter Card Number',
                    borderColor: textFieldFillGrey,
                    borderRadius: 8,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    fillColor: textFieldFillGrey,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 22.0, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 5,
                          child: RoundedRectTextField(
                            hintText: 'MM/YY',
                            borderColor: textFieldFillGrey,
                            borderRadius: 8,
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            fillColor: textFieldFillGrey,
                          ),
                        ),
                        SizedBox(width: 18,),
                        Expanded(
                          flex: 3,
                          child: RoundedRectTextField(
                            hintText: 'CVC',
                            borderColor: textFieldFillGrey,
                            borderRadius: 8,
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            fillColor: textFieldFillGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MainButton(
                    onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => const OrderConfirmationView()), (route) => route.isFirst),
                    title: 'Done',
                    height: 40,
                    width: 170,
                    borderRadius: 8,
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}

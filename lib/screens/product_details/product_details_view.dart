import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoparrazi/helpers/constants.dart';
import 'package:shoparrazi/widgets/top_container.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return TopContainer(
      containerBackGround: Colors.white,
        topChildren: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 22, color: textBlack,),
            ),
          ),
          Image.asset('assets/images/${productsList[index]['name'].toLowerCase()}.png', width: MediaQuery.of(context).size.width, height: 200,)
        ],
        bottomChild: Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              color: primaryTextGrey.withOpacity(0.4)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Column(
                    children: [
                      Text(
                        productsList[index]['name']!,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: textBlack
                        ),
                      ),
                      SizedBox(height: 18,),
                      RichText(text: TextSpan(
                        text: "${productsList[index]['price'].toString()} Rs ",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: textBlack
                        ),
                        children: [
                          TextSpan(
                            text: '/ kg',
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                color: primaryDullGreen
                            ),
                          )
                        ]
                      )
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                      Text(
                        'Quantity',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: textBlack
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}

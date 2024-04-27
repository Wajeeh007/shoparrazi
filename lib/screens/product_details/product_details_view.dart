import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:shoparrazi/helpers/constants.dart';
import 'package:shoparrazi/widgets/buttons.dart';
import 'package:shoparrazi/widgets/top_container.dart';

import '../../widgets/bottom_container.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TopContainer(
        containerBackGround: Colors.white,
          topChildren: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/${productsList[index]['name'].toLowerCase()}.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 22, color: textBlack,),
                  ),
                )
              ],
            )
          ],
          bottomChild: BottomContainer(
            color: primaryTextGrey.withOpacity(0.2),
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
                      const SizedBox(height: 18,),
                      RichText(text: TextSpan(
                        text: "${productsList[index]['price'].toString()} Rs ",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: textBlack
                        ),
                        children: [
                          TextSpan(
                            text: '/ kg',
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                color: primaryGreen
                            ),
                          )
                        ]
                      )
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.05,),
                        child: RatingStars(
                          valueLabelVisibility: false,
                          value: productsList[index]['rating'],
                        ),
                      ),
                      Text(
                        'Quantity',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: textBlack
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 0.7
                                )
                              ),
                              width: 32,
                              height: 32,
                              child: const Icon(Icons.remove, size: 15, color: Colors.black,),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              '2',
                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: primaryGreen
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.black,
                                      width: 0.7
                                  )
                              ),
                              width: 32,
                              height: 32,
                              child: const Icon(Icons.add, size: 15, color: Colors.black,),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04),
                        child: MainButton(onPressed: () {}, title: 'Buy', backgroundColor: Colors.white, width: 170, height: 40, borderRadius: 15, textColor: primaryGreen,),
                      ),
                      MainButton(onPressed: () {}, title: 'Add to Cart', width: 170, height: 40, borderRadius: 15,)
                    ],
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../helpers/constants.dart';
import '../../widgets/textfields.dart';
import '../../widgets/top_container.dart';
import '../cart/cart_view.dart';
import '../categories/categories_view.dart';
import '../category_product_list/category_product_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return TopContainer(
        topChildren: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Hi, Good Evening', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),),
                IconButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const CartView())),
                    icon: const Icon(Icons.shopping_cart_outlined, size: 25, color: Colors.white,)
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text('Let\'s search your grocery items.', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30, bottom: 20, left: 15, right: 15),
            child: RoundedRectTextField(
              hintText: 'Search grocery items',
              prefixIcon: Icons.search_rounded,
            ),
          ),
        ],
        bottomChild:
        Expanded(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15),),
                  color: Colors.white
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Categories', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),),
                        TextButton(
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const CategoriesView())),
                          child: Text(
                            'See all',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.blueAccent
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CategoryProductListView(categoryName: categoriesList[index])));
                                  },
                                  child: SizedBox(
                                    width: 170,
                                    height: 150,
                                    child: Card(
                                      color: const Color(0xffD7D9D8),
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      margin: const EdgeInsets.all(12),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset('assets/images/${categoriesList[index].toLowerCase()}.png'),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(categoriesList[index], style: Theme.of(context).textTheme.bodySmall?.copyWith(color: textBlack),)
                              ],
                            );
                          }
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                          itemCount: offersList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: primaryLightGreen,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Image.asset(
                                          offersList[index]['image']!,
                                          width: 40,
                                          height: 60,
                                        ),
                                      ),
                                      const SizedBox(width: 15,),
                                      Expanded(
                                        flex: 4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(offersList[index]['title']!, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: textBlack),),
                                            const SizedBox(height: 8,),
                                            RichText(text: TextSpan(
                                                text: "${offersList[index]['subtitle_heading']} ",
                                                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: primaryDullGreen),
                                                children: [
                                                  TextSpan(
                                                    text: offersList[index]['subtitle_detail'],
                                                    style: Theme.of(context).textTheme.labelMedium?.copyWith(color: textBlack),),
                                                ]
                                            ))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  InkWell(
                                    splashFactory: NoSplash.splashFactory,
                                    onTap: () {},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Buy Now',
                                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                              color: Colors.black
                                          ),
                                        ),
                                        const SizedBox(width: 4,),
                                        const Icon(Icons.arrow_forward_ios_rounded, size: 12, color: textBlack,)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }
                      ),
                    )
                  ],
                ),
              )
          ),
        )
    );
  }
}

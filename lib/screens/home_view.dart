import 'package:flutter/material.dart';
import 'package:shoparrazi/helpers/constants.dart';
import 'categories/categories_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Categories', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),),
            TextButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CategoriesView())),
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
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
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
                    Text(categoriesList[index], style: Theme.of(context).textTheme.bodySmall?.copyWith(color: textBlack),)
                  ],
                );
              }
          ),
        ),
        Expanded(
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
    );
  }
}
import 'package:flutter/material.dart';
import 'package:shoparrazi/helpers/constants.dart';
import 'package:shoparrazi/screens/category_product_list/category_product_list_view.dart';
import 'package:shoparrazi/screens/product_details/product_details_view.dart';
import 'package:shoparrazi/widgets/bottom_navbar.dart';
import 'package:shoparrazi/widgets/top_container.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TopContainer(
        onBackIconPressed: () => Navigator.pop(context),
        bottomHeadingText: 'Categories',
          bottomChild: Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
              ),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    childAspectRatio: 0.855,
                    mainAxisSpacing: 25,
                  ),
                  itemCount: categoriesList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: InkWell(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CategoryProductListView(categoryName: categoriesList[index],))),
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
          )
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
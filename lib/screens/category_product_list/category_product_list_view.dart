import 'package:flutter/material.dart';
import 'package:shoparrazi/helpers/constants.dart';
import 'package:shoparrazi/widgets/bottom_navbar.dart';
import 'package:shoparrazi/widgets/top_container.dart';
import '../product_details/product_details_view.dart';

class CategoryProductListView extends StatelessWidget {
  const CategoryProductListView({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TopContainer(
          onBackIconPressed: () => Navigator.pop(context),
          bottomHeadingText: categoryName,
          bottomChild: Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
              ),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: productsList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          width: 180,
                          height: 150,
                          child: InkWell(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ProductDetailsView(index: index))),
                            child: Card(
                              color: const Color(0xffD7D9D8),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              margin: const EdgeInsets.all(12),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/images/${productsList[index]['name'].toLowerCase()}.png'),
                              ),
                            ),
                          ),
                        ),
                        Text(productsList[index]['name'], style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: textBlack),)
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
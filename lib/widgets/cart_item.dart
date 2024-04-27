import 'package:flutter/material.dart';
import '../helpers/constants.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.index});

  final int index;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {

  bool longPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => longPressed = false),
      onLongPress: () => setState(() => longPressed = true),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: primaryTextGrey.withOpacity(0.3)
        ),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: longPressed ? [
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.delete_outline_rounded, color: Colors.red.shade700, size: 50,),
              ),
            ),
            Expanded(
              flex: 1,
              child: Image.asset('assets/images/${productsList[widget.index]['name'].toLowerCase()}.png', width: 45,),
            ),
            const SizedBox(width: 15,),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productsList[widget.index]['name'],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: textBlack,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      productsList[widget.index]['available_quantity'].toString(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: productsList[widget.index]['price'].toString(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.w300
                      ),
                      children: [
                        TextSpan(
                          text: ' Rs Only',
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: Colors.grey,
                              fontWeight: FontWeight.w300
                          ),
                        )
                      ]
                    ),
                  )
                ],
              ),
            )
          ] : [
            Expanded(
              flex: 1,
              child: Image.asset('assets/images/${productsList[widget.index]['name'].toLowerCase()}.png',),
            ),
            const SizedBox(width: 15,),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productsList[widget.index]['name'],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: textBlack,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      productsList[widget.index]['available_quantity'].toString(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: productsList[widget.index]['price'].toString(),
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300
                            ),
                            children: [
                              TextSpan(
                                text: ' Rs Only',
                                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w300
                                ),
                              )
                            ]
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: primaryGreen,
                                      width: 0.7
                                  )
                              ),
                              width: 25,
                              height: 25,
                              child: const Icon(Icons.remove, size: 15, color: primaryGreen,),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              '2',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: primaryGreen
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: primaryGreen,
                                      width: 0.7
                                  )
                              ),
                              width: 25,
                              height: 25,
                              child: const Icon(Icons.add, size: 15, color: primaryGreen,),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
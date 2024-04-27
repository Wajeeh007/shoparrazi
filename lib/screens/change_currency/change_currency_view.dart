import 'package:flutter/material.dart';
import 'package:shoparrazi/helpers/constants.dart';
import 'package:shoparrazi/widgets/bottom_container.dart';
import 'package:shoparrazi/widgets/top_container.dart';

class ChangeCurrencyView extends StatefulWidget {
  const ChangeCurrencyView({super.key});

  @override
  State<ChangeCurrencyView> createState() => _ChangeCurrencyViewState();
}

class _ChangeCurrencyViewState extends State<ChangeCurrencyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TopContainer(
        bottomHeadingText: 'Currency',
        includeCartIcon: false,
        bottomChild: BottomContainer(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(currencyList.length, (index) => InkWell(
                onTap: () {
                  for (var element in currencyList) {
                    setState(() => element['selected'] = false);
                  }
                  setState(() {
                    currencyList[index]['selected'] = true;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: primaryTextGrey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: currencyList[index]['selected'] ? primaryGreen : primaryTextGrey,
                          child: const Icon(Icons.check, size: 30, color: Colors.white,),
                        ),
                      ),
                      const SizedBox(width: 25,),
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currencyList[index]['title'],
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: textBlack
                              ),
                            ),
                            Text(
                              currencyList[index]['full_form'],
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: textBlack
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
              ),
            ),
          ),
        ),
      ),
    );
  }
}

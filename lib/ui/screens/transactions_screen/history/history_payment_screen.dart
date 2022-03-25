import 'package:finsem_org/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryPaymentScreen extends StatelessWidget {
  const HistoryPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FinColours.secondaryColor,
      child: Center(
        child: ListView.builder(
            itemCount: 9,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(18, 10, 18, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: FinColours.transactionBackground4,
                    ),
                    height: 80,
                    width: 300.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Maintenance Feb",
                              style: TextStyle(
                                  color: FinColours.grey, fontSize: 18),
                            ),
                            Text(
                              "₹ 14,000",
                              style: TextStyle(
                                  color: FinColours.secondaryTextColor,
                                  fontSize: 24),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Paid",
                              style: TextStyle(
                                  color: FinColours.green, fontSize: 18),
                            ),
                            Text(
                              "16 Feb",
                              style: TextStyle(
                                  color: FinColours.secondaryTextColor,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              );
            }),
      ),
    );
  }
}

import 'package:finsem_org/ui/component/dummy.dart';
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
            itemCount: DummyData().paymentHistory.length,
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
                    height: 120,
                    width: 300.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //TODO:FIREBASE CONNECTION PAYMENT HISTORY
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              //Name of sender
                              DummyData().paymentHistory[index].senderName,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              //room
                              DummyData().paymentHistory[index].blockRoom,
                              style: TextStyle(
                                  color: FinColours.secondaryTextColor,
                                  fontSize: 14),
                            ),
                            Text(
                              //purpose
                              DummyData().paymentHistory[index].purpose,
                              style: TextStyle(
                                  color: FinColours.secondaryTextColor,
                                  fontSize: 14),
                            ),
                            Text(
                              //trx date
                              DummyData().paymentHistory[index].dateTime,
                              style: TextStyle(
                                  color: FinColours.secondaryTextColor,
                                  fontSize: 14),
                            ),
                            Text(
                              //trx id
                              DummyData().paymentHistory[index].trxID,
                              style: TextStyle(
                                  color: FinColours.secondaryTextColor,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              DummyData().paymentHistory[index].amount,
                              style: TextStyle(
                                  color: FinColours.secondaryTextColor,
                                  fontSize: 24),
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

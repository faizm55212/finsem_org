import 'package:finsem_org/ui/component/dummy.dart';
import 'package:finsem_org/utils/colours.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class PendingPaymentScreen extends StatelessWidget {
  const PendingPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FinColours.secondaryColor,
      child: Center(
        child: ListView.builder(
            itemCount: DummyData().paymentPending.length,
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
                      color: FinColours.transactionBackground2,
                    ),
                    height: 120,
                    width: 300.w,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //TODO:FIREBASE CONNECTION PENDING PAYMENT
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  //Name of sender
                                  DummyData().paymentPending[index].pName,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  //room
                                  DummyData().paymentPending[index].blockRoom,
                                  style: TextStyle(
                                      color: FinColours.secondaryTextColor,
                                      fontSize: 14),
                                ),
                                Text(
                                  //purpose
                                  DummyData().paymentPending[index].purpose,
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
                                  "₹ " +
                                      DummyData().paymentPending[index].amount,
                                  style: TextStyle(
                                      color: FinColours.secondaryTextColor,
                                      fontSize: 24),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              child: Container(
                                height: 35,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18.0),
                                    color: Color(0xffa22356)),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.sms,
                                        color: Colors.white,
                                        size: 16.0,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        'SMS',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                final Uri launchUri = Uri(
                                    scheme: 'sms',
                                    path: DummyData()
                                        .paymentPending[index]
                                        .number,
                                    queryParameters: {
                                      'body': 'Payment Pending of amount' +
                                          DummyData()
                                              .paymentPending[index]
                                              .amount
                                    });
                                await launchUrl(launchUri);
                              },
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              child: Container(
                                height: 35,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18.0),
                                    color: Color(0xffa22356)),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.call,
                                        color: Colors.white,
                                        size: 16.0,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        'Call',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                final Uri launchUri = Uri(
                                  scheme: 'tel',
                                  path:
                                      DummyData().paymentPending[index].number,
                                );
                                await launchUrl(launchUri);
                              },
                            ),
                          ],
                        )
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

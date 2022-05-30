import 'package:finsem_org/ui/component/dummy.dart';
import 'package:finsem_org/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CrowdfundingPaymentScreen extends StatelessWidget {
  const CrowdfundingPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FinColours.secondaryColor,
      child: ListView.builder(
          itemCount: DummyData().paymentDonation.length,
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
                    color: FinColours.transactionBackground3,
                  ),
                  height: 120,
                  width: 300.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //TODO:FIREBASE CONNECTION DONATION RECIEVED
                          Text(
                            //Name of sender
                            DummyData().paymentDonation[index].pName,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            //room
                            DummyData().paymentDonation[index].blockRoom,
                            style: TextStyle(
                                color: FinColours.secondaryTextColor,
                                fontSize: 14),
                          ),
                          Text(
                            //purpose
                            DummyData().paymentDonation[index].purpose,
                            style: TextStyle(
                                color: FinColours.secondaryTextColor,
                                fontSize: 14),
                          ),
                          Text(
                            //trx date
                            "25/05/2022 10:20 PM",
                            style: TextStyle(
                                color: FinColours.secondaryTextColor,
                                fontSize: 14),
                          ),
                          Text(
                            //trx id
                            "ID : " + "IB123564895",
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
                            "₹ " + DummyData().paymentHistory[index].amount,
                            style: TextStyle(
                                color: FinColours.secondaryTextColor,
                                fontSize: 24),
                          ),
                          // Text(
                          //   "Due",
                          //   style:
                          //       TextStyle(color: FinColours.red, fontSize: 18),
                          // ),
                          // Text(
                          //   "14 Mar",
                          //   style:
                          //       TextStyle(color: FinColours.red, fontSize: 18),
                          // ),
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
    );
  }
}

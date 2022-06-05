import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finsem_org/controller/api.dart';
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
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: Api.fetchPayments(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.black),
                );
              }
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snap.data!.docs.length,
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
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snap.data!.docs[index].data()['pName'],
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    snap.data!.docs[index].data()['tBlockRoom'],
                                    style: TextStyle(
                                        color: FinColours.secondaryTextColor,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    snap.data!.docs[index].data()['tDesc'],
                                    style: TextStyle(
                                        color: FinColours.secondaryTextColor,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    "${DateTime.fromMillisecondsSinceEpoch(snap.data!.docs[index].data()['time']).day}/${DateTime.fromMillisecondsSinceEpoch(snap.data!.docs[index].data()['time']).month}/${DateTime.fromMillisecondsSinceEpoch(snap.data!.docs[index].data()['time']).year}",
                                    style: TextStyle(
                                        color: FinColours.secondaryTextColor,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    //trx id
                                    snap.data!.docs[index].data()['tID'],
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
                                    snap.data!.docs[index]
                                        .data()['amount']
                                        .toString(),
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
                  });
            }),
      ),
    );
  }
}

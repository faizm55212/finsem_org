import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finsem_org/controller/api.dart';
import 'package:finsem_org/ui/component/curved_appbar.dart';
//import 'package:finsem_org/ui/component/dummy.dart';
import 'package:finsem_org/ui/screens/housekeeping/add_house_keeping.dart';
import 'package:finsem_org/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class HousekeepingScreen extends StatelessWidget {
  const HousekeepingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(
        title: "Housekeeping",
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(
                height: 620.h,
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: Api.fetchHousekeeping(),
                    builder: (context, snap) {
                      if (snap.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(18, 10, 10, 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xffbbeade),
                                  ),
                                  height: 135,
                                  width: 300.w,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          //TODO:FIREBASE CONNECTION PENDING PAYMENT
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                //Name of sender
                                                //"Name",
                                                snap.data!.docs[index]
                                                        .data()['name'] +
                                                    "  (" +
                                                    snap.data!.docs[index]
                                                        .data()['serviceType'] +
                                                    ")",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              SizedBox(
                                                height: 85,
                                                width: 170.w,
                                                child: Text(
                                                  //Service Description
                                                  snap.data!.docs[index].data()[
                                                      'serviceDescription'],
                                                  maxLines: 4,
                                                  overflow:
                                                      TextOverflow.ellipsis,

                                                  style: TextStyle(
                                                      color: FinColours
                                                          .secondaryTextColor,
                                                      fontSize: 16),
                                                ),
                                              ),
                                            ],
                                          ),
                                          MaterialButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                            child: Container(
                                              height: 35,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                  color:
                                                      const Color(0xffa22356)),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
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
                                                path: snap.data!.docs[index]
                                                    .data()['mobile'],
                                              );
                                              await launchUrl(launchUri);
                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: const [],
                                      )
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
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddHousekeeping(),
                  ),
                );
              },
              label: Row(
                children: const [
                  Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 30,
                  ),
                  // Text("Add New"),
                ],
              )),
        ));
  }
}

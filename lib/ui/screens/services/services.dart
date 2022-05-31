import 'package:finsem_org/ui/component/curved_appbar.dart';
import 'package:finsem_org/ui/component/dummy.dart';
import 'package:finsem_org/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(
        title: "Services",
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Container(
                height: 620.h,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
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
                              color: Color(0xffbbeade),
                            ),
                            height: 80,
                            width: 300.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //TODO:FIREBASE CONNECTION PENDING PAYMENT
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          //Name of sender
                                          "Name",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          //Type of Service
                                          "Jio Fiber",
                                          style: TextStyle(
                                              color:
                                                  FinColours.secondaryTextColor,
                                              fontSize: 17),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        MaterialButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                          child: Container(
                                            height: 35,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                                color: Color(0xffa22356)),
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
                                              path: DummyData()
                                                  .paymentPending[index]
                                                  .number,
                                            );
                                            await launchUrl(launchUri);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [],
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
              // MaterialButton(
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(18.0),
              //   ),
              //   child: Container(
              //     height: 35,
              //     width: 140,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(18.0),
              //         color: FinColours.mainColor),
              //     child: const Center(
              //       child: Text(
              //         'Add New',
              //         style: TextStyle(
              //           fontSize: 16.0,
              //           color: Colors.white,
              //         ),
              //       ),
              //     ),
              //   ),
              //   onPressed: () {},
              // ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () {},
              label: Row(
                children: [
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

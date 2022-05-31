import 'package:finsem_org/ui/component/curved_appbar.dart';
import 'package:finsem_org/ui/component/dummy.dart';
import 'package:finsem_org/ui/screens/housekeeping/addHousekeeping.dart';
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
              Container(
                height: 620.h,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: DummyData().housekeeping.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(18, 10, 10, 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffbbeade),
                            ),
                            height: 135,
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
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          //Name of sender
                                          //"Name",
                                          DummyData().housekeeping[index].name +
                                              "  (" +
                                              DummyData()
                                                  .housekeeping[index]
                                                  .type +
                                              ")",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 85,
                                          width: 170.w,
                                          child: Text(
                                            //Type of Service
                                            DummyData()
                                                .housekeeping[index]
                                                .desc,
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,

                                            style: TextStyle(
                                                color: FinColours
                                                    .secondaryTextColor,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      child: MaterialButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                        child: Container(
                                          height: 35,
                                          width: 70,
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
                                                .housekeeping[index]
                                                .mobile,
                                          );
                                          await launchUrl(launchUri);
                                        },
                                      ),
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
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddHousekeeping(),
                  ),
                );
              },
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

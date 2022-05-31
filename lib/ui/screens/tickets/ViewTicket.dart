import 'package:finsem_org/ui/component/curved_appbar.dart';
import 'package:finsem_org/ui/component/dummy.dart';
import 'package:finsem_org/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewTicketScreen extends StatefulWidget {
  final int ticketID;
  ViewTicketScreen({Key? key, required this.ticketID});

  @override
  State<ViewTicketScreen> createState() => _ViewTicketScreenState();
}

class _ViewTicketScreenState extends State<ViewTicketScreen> {
  String _updateStatusvalue = "Recieved";
  var updateStatus = [
    'Recieved',
    'Under Progress',
    'Resolved',
  ];

  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(
        title: "Tickets",
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 250.h,
                      width: 340.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(
                                //TODO: Update the image url path with backend
                                DummyData().tickets[widget.ticketID].tImg),
                            fit: BoxFit.fill,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  DummyData().tickets[widget.ticketID].tDesc,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  DummyData().tickets[widget.ticketID].tBlockRoom,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
                Text(
                  "Req Type : " +
                      "${DummyData().tickets[widget.ticketID].tType}",
                  style: GoogleFonts.poppins(
                    color: FinColours.grey,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "ID: " + "${DummyData().tickets[widget.ticketID].tID}",
                  style: GoogleFonts.poppins(
                    color: FinColours.grey,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Status : " +
                      "${DummyData().tickets[widget.ticketID].tstatus}",
                  style: GoogleFonts.poppins(
                    color: FinColours.grey,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Center(
                  child: SizedBox(
                    width: 250.w,
                    height: 55.h,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.black38,
                              width: 1), //border of dropdown button
                          borderRadius: BorderRadius.circular(
                              20), //border raiuds of dropdown button
                        ),
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                            child: DropdownButton(
                              value: _updateStatusvalue,

                              items: updateStatus.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),

                              onChanged: (String? newValue) {
                                setState(() {
                                  _updateStatusvalue = newValue!;
                                });
                              }, //dropdown background color
                              underline: Container(),
                              isExpanded: true,
                              icon: Padding(
                                  padding: EdgeInsets.only(left: 0),
                                  child:
                                      Icon(Icons.keyboard_arrow_down_rounded)),
                            ))),
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Container(
                    height: 35,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        color: FinColours.mainColor),
                    child: const Center(
                      child: Text(
                        'Update',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    DummyData().tickets[widget.ticketID].tstatus ==
                        _updateStatusvalue;
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

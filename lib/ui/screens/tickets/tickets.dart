import 'package:finsem_org/ui/component/curved_appbar.dart';
import 'package:finsem_org/ui/component/dummy.dart';
import 'package:finsem_org/ui/screens/tickets/ViewTicket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colours.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(
        title: "Tickets",
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: SizedBox(
              height: 700.h,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,

                //TODO: Update the list with Firebase
                itemCount: DummyData().tickets.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 95.h,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewTicketScreen(
                                ticketID: index,
                              ),
                            ),
                          );
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(15),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DummyData().tickets[index].tBlockRoom,
                                  //"Req: " + "Tower1 " + "-" + " 1304",
                                  style: GoogleFonts.roboto(
                                    color: FinColours.secondaryTextColor,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "Req Type : " +
                                      "${DummyData().tickets[index].tType}",
                                  style: GoogleFonts.poppins(
                                    color: FinColours.grey,
                                    fontSize: 12,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "ID: " + "${DummyData().tickets[index].tID}",
                                  style: GoogleFonts.poppins(
                                    color: FinColours.grey,
                                    fontSize: 12,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "Status : " +
                                      "${DummyData().tickets[index].tstatus}",
                                  style: GoogleFonts.poppins(
                                    color: FinColours.grey,
                                    fontSize: 12,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}

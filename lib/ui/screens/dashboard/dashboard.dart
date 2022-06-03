import 'package:finsem_org/controller/user_controller.dart';
import 'package:finsem_org/ui/screens/add_notice/add_notice.dart';
import 'package:finsem_org/ui/screens/add_user/add_user.dart';
import 'package:finsem_org/ui/screens/event_screen/event_screen.dart';
import 'package:finsem_org/ui/screens/housekeeping/housekeeping.dart';
import 'package:finsem_org/ui/screens/services/services.dart';
import 'package:finsem_org/ui/screens/tickets/tickets.dart';
import 'package:finsem_org/ui/screens/transactions_screen/payment_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finsem_org/ui/component/svg_icon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:finsem_org/ui/component/dashboard_options.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double _height = 60.h;
  double _radius = 0;
  bool _expanded = false;
  bool _visible = false;
  void expand() {
    setState(() {
      _expanded = !_expanded;
      _expanded ? _height = 750.h : _height = 60.h;
      _expanded ? _radius = 30.h : _radius = 0.h;
      Future.delayed(const Duration(milliseconds: 500)).then((value) {
        setState(() {
          _visible = !_visible;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xff483c94),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50.h, left: 50.h),
                color: const Color(0xff483c94),
                width: 300.h,
                height: 60.h,
              ),
              Container(
                margin: EdgeInsets.only(top: 60.h),
                width: 360.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.h),
                  ),
                ),
                child: Column(
                  children: const [],
                ),
              ),
              AnimatedContainer(
                padding: _visible
                    ? EdgeInsets.only(right: 20.w, left: 20.w, top: 20.h)
                    : EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                height: _height,
                width: 360.w,
                decoration: BoxDecoration(
                  color: const Color(0xff483c94),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.h),
                    bottomRight: Radius.circular(_radius),
                  ),
                ),
                duration: const Duration(seconds: 1),
                curve: Curves.linearToEaseOut,
                child: Column(
                  children: [
                    FutureBuilder<Map<String, dynamic>>(
                        builder: (context, snap) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgIcon(
                                color: 0xffffffff,
                                assetPath: "assets/icons/menu-dots.svg",
                                size: 25,
                                onPressed: expand,
                              ),
                              SizedBox(width: 20.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    UserController.loggedInUser.value.name,
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const CircleAvatar(
                            radius: 20, // Image radius
                            backgroundImage:
                                AssetImage("assets/images/profile_pic.jpg"),
                          ),
                        ],
                      );
                    }),
                    Visibility(
                      visible: _visible,
                      child: _height == 750.h
                          ? Container(
                              margin: EdgeInsets.symmetric(vertical: 30.h),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      DashboardOptions(
                                        title: 'Add User',
                                        asset: "assets/images/addUser.png",
                                        onPressed: () {
                                          expand();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const AddUser(),
                                            ),
                                          );
                                        },
                                      ),
                                      DashboardOptions(
                                        title: 'Events',
                                        asset: "assets/images/events.png",
                                        onPressed: () {
                                          expand();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const EventsScreen(),
                                              ));
                                        },
                                      ),
                                      DashboardOptions(
                                        title: 'Notice',
                                        asset: "assets/images/notice.png",
                                        onPressed: () {
                                          expand();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const AddNotice(),
                                              ));
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      DashboardOptions(
                                        title: 'Payments',
                                        asset: "assets/images/payments.png",
                                        onPressed: () {
                                          expand();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const PaymentScreen(),
                                              ));
                                          //PaymentScreen
                                        },
                                      ),
                                      DashboardOptions(
                                        title: 'Tickets',
                                        asset: "assets/images/tickets.png",
                                        onPressed: () {
                                          expand();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const TicketsScreen(),
                                              ));
                                        },
                                      ),

                                      //TicketsScreen
                                      DashboardOptions(
                                        title: 'Services',
                                        asset: "assets/images/service.png",
                                        onPressed: () {
                                          expand();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const ServicesScreen(),
                                              ));
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      DashboardOptions(
                                        title: 'Housekeeping',
                                        asset: "assets/images/housekeeping.png",
                                        onPressed: () {
                                          expand();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const HousekeepingScreen(),
                                              ));
                                        },
                                      ),
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      FirebaseAuth.instance.signOut();
                                    },
                                    child: Text(
                                      'Sign out',
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

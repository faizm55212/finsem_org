import 'package:finsem_org/ui/screens/add_user/add_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finsem_org/ui/component/svg_icon.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double _height = 60.h;
  double _radius = 0;
  bool _expanded = false;
  void expand() {
    _expanded ? _height = 750.h : _height = 60.h;
    _expanded ? _radius = 30.h : _radius = 0.h;
    setState(() {
      _expanded = !_expanded;
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
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddUser(),
                          ),
                        );
                      },
                      child: const Text('Add User'),
                    ),
                    TextButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      child: const Text(
                        'Sign out',
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
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
                child: Container(
                  padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgIcon(
                            color: 0xffffffff,
                            assetPath: "assets/icon/menu-dots.svg",
                            size: 25,
                            onPressed: expand,
                          ),
                          SizedBox(width: 20.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Dhiraj Gupta",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              Text(
                                "Tower1  1304",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.white),
                              )
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

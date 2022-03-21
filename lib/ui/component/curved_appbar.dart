import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurvedAppBar extends StatelessWidget {
  const CurvedAppBar({
    required this.title,
    required this.child,
    Key? key,
  }) : super(key: key);
  final String title;
  final Widget child;

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
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                width: 360.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.h),
                  ),
                ),
                child: child,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                height: 60.h,
                width: 360.w,
                decoration: BoxDecoration(
                  color: const Color(0xff483c94),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.h),
                  ),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Text(
                      title,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
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

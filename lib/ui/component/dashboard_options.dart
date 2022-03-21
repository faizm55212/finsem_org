import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardOptions extends StatelessWidget {
  final String title;
  final String asset;
  final void Function()? onPressed;

  const DashboardOptions({
    required this.title,
    required this.asset,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: 140.h,
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 35.w, // Image radius
              backgroundImage: AssetImage(asset),
            ),
            SizedBox(height: 10.h),
            Text(
              title,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

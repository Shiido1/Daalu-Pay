import 'package:daalu_pay_admin/ui/app_assets/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/text_widget.dart';

// ignore: must_be_immutable
class ImageScreen extends StatelessWidget {
  ImageScreen({super.key, required this.image});
  String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: SafeArea(
        child: Center(
          child: Image.network(
            image ?? '',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.grey.withOpacity(.3),
              ),
              child: Center(
                child: TextView(
                  text: '',
                  fontSize: 13.2.sp,
                  color: AppColor.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

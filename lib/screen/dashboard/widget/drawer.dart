import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/widget/divider/divider_widget.dart';
import 'package:beonchat_admin/widget/logo/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.type});

  final int type;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colours().ternary,
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 20.sp),
        child: Column(
          children: [
            LogoText(
              size: type == 3 ? 47 : 40,
              space: type == 3 ? -3.52 : -2.7,
              color: Colours().white,
            ),
            DividerWidget(
              vPadding: 20.sp,
            ),
          ],
        ),
      ),
    );
  }
}

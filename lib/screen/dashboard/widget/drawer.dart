import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/const/styles.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 25.sp, vertical: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: LogoText(
                size: type == 3 ? 47 : 40,
                space: type == 3 ? -3.52 : -2.7,
                color: Colours().white,
              ),
            ),
            DividerWidget(
              vPadding: 20.sp,
            ),
            Text(
              "NAVIGATIONS",
              style: Styles().normalS(
                fontW: FontWeight.w500,
                color: Colours().grey,
                size: type == 3 ? 18 : 17,
              ),
            ),
            DrawerOptionTile(
              type: type,
              icon: Icons.dashboard_outlined,
              title: "dashboard",
              arrow: false,
            ),
            DrawerOptionTile(
              type: type,
              icon: Icons.groups,
              title: "profiles",
              arrow: true,
            ),
            DrawerOptionTile(
              type: type,
              icon: Icons.groups,
              title: "bulk registration",
              arrow: true,
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerOptionTile extends StatelessWidget {
  const DrawerOptionTile(
      {super.key, required this.title, required this.type, required this.icon, required this.arrow});

  final String title;
  final int type;
  final IconData icon;
  final bool arrow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.sp),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
          ),
          SizedBox(
            width: 10.sp,
          ),
          Expanded(
            child: Text(
              title,
              style: Styles().normalS(
                fontW: FontWeight.w400,
                color: Colours().white,
                size: type == 3 ? 18 : 17,
              ),
            ),
          ),
          Image.asset("assets/image/forward-arrow.png",height: 15,color: Colours().grey,)
        ],
      ),
    );
  }
}

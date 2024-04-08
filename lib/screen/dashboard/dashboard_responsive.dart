import 'package:beonchat_admin/const/screen_size.dart';
import 'package:beonchat_admin/screen/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class DashBoardResponsive extends StatelessWidget {
  const DashBoardResponsive({Key? key}) : super(key: key);

  static String routeName = "/dashboard";

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileSize) {
          return const DashBoard(
            type: 1,
          );
        } else if (constraints.maxWidth < tabSize) {
          return const DashBoard(
            type: 2,
          );
        } else {
          return const DashBoard(
            type: 3,
          );
        }
      },
    );
  }
}

import 'package:beonchat_admin/screen/dashboard/dashboard.dart';
import 'package:beonchat_admin/widget/responsive/my_responsive.dart';
import 'package:flutter/material.dart';

class DashBoardResponsive extends StatelessWidget {
  const DashBoardResponsive({Key? key}) : super(key: key);

  static String routeName = "/dashboard";

  @override
  Widget build(BuildContext context) {
    return MyResponsive(builder: (BuildContext context2, _, screenMT) {
      return DashBoard(
        type: screenMT.isMobile
            ? 1
            : screenMT.isTablet
                ? 2
                : 3,
      );
    });
  }
}

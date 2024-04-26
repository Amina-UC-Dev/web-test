import 'dart:async';

import 'package:beonchat_admin/provider/reports/user_registration_report_provider.dart';
import 'package:beonchat_admin/screen/reports/user_registration_report/user_registration_report.dart';
import 'package:beonchat_admin/widget/responsive/my_responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserRegistrationReportResponsive extends StatefulWidget {
  const UserRegistrationReportResponsive({Key? key}) : super(key: key);

  static String routeName = "/reports-user-registration";

  @override
  State<UserRegistrationReportResponsive> createState() => _UserRegistrationReportResponsiveState();
}

class _UserRegistrationReportResponsiveState extends State<UserRegistrationReportResponsive> {

  void initState() {
    call();
    super.initState();
  }

  call() async {
    Timer(const Duration(seconds: 2), () {
      Provider.of<UserRegistrationReportProvider>(context, listen: false).gettingList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyResponsive(builder: (BuildContext context2, _, screenMT) {
      return UserRegistrationReport(
        type: screenMT.isMobile
            ? 1
            : screenMT.isTablet
                ? 2
                : 3,
      );
    });
  }
}

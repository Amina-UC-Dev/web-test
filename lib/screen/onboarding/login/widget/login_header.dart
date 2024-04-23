import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/provider/onboarding/login_provider.dart';
import 'package:beonchat_admin/widget/logo/logo.dart';
import 'package:beonchat_admin/widget/util/my_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key, required this.type}) : super(key: key);

  final int type;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Consumer<LoginProvider>(builder: (context2, provider, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/image/logo.svg",
            height: (type == 3 ? 150 : 100).sp,
            width: (type == 3 ? 150 : 100).sp,
          ),
          MySpacing.height(type == 1 ? 20 : 15),
          LogoText(
            size: type == 3 ? 61 : 48,
            space: type == 3 ? -3.78 : -3.6,
            color: Colours().white,
          ),
        ],
      );
    });
  }
}

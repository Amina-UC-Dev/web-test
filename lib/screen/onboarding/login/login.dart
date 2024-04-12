import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/provider/onboarding/login_provider.dart';
import 'package:beonchat_admin/screen/onboarding/login/widget/login_body.dart';
import 'package:beonchat_admin/screen/onboarding/login/widget/login_form.dart';
import 'package:beonchat_admin/widget/logo/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({Key? key, required this.type}) : super(key: key);

  final int type;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Consumer<LoginProvider>(builder: (context2, provider, child) {
      return Scaffold(
        backgroundColor: type == 1 ? Colours().black : Colours().white,
        body: Center(
          child: Container(
            width: type == 3 ? w / 1.8 : w,
            height: type == 3 ? h / 1.7 : type == 2 ? h / 1.5 : h,
            margin: EdgeInsets.all((type == 1 ? 40 : 60).sp),
            decoration: BoxDecoration(
              color: Colours().black,
              borderRadius: BorderRadius.circular(20.sp),
              boxShadow: [
                BoxShadow(
                  color: Colours().black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: (type == 1 ? 40 : 55).sp,
                  vertical: (type == 1 ? 50 : 60).sp),
              child: type == 1
                  ? LoginMobBody(
                      type: type,
                    )
                  : LoginWebBody(
                      type: type,
                    ),
            ),
          ),
        ),
      );
    });
  }
}

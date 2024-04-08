import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/const/styles.dart';
import 'package:beonchat_admin/provider/onboarding/login_provider.dart';
import 'package:beonchat_admin/screen/dashboard/dashboard_responsive.dart';
import 'package:beonchat_admin/widget/button/button.dart';
import 'package:beonchat_admin/widget/logo/logo.dart';
import 'package:beonchat_admin/widget/textfield/textfield.dart';
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
        backgroundColor: Colours().white,
        body: Center(
          child: Container(
            width: type == 3 ? w / 1.8 : w,
            height: type == 3 ? h / 1.7 : h / 1.5,
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
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: (type == 1 ? 20 : 50).sp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/image/logo.svg",
                            // fit: BoxFit.cover,
                            height: (type == 3 ? 150 : 100).sp,
                            width: (type == 3 ? 150 : 100).sp,
                          ),
                          SizedBox(
                            height: (type == 1 ? 20 : 15).sp,
                          ),
                          LogoText(
                            size: type == 3 ? 61 : 48,
                            space: type == 3 ? -3.78 : -3.6,
                            color: Colours().white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: (type == 1 ? 20 : 50).sp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "welcome back",
                            style: Styles().normalS(
                              fontW: FontWeight.w500,
                              color: Colours().white,
                              size: type == 3 ? 25 : 20,
                            ),
                          ),
                          SizedBox(
                            height: (type == 1 ? 30 : 50).sp,
                          ),
                          TextFieldWidget().hintTextField(
                            controller: provider.email,
                            type: type,
                            inputType: TextInputType.emailAddress,
                            hintText: "email",
                            obscure: false,
                            validator: (val) {
                              return null;
                            },
                            onChange: (val) {},
                            onSubmit: (val) {},
                            textColor: Colours().white,
                          ),
                          SizedBox(
                            height: (type == 1 ? 10 : 15).sp,
                          ),
                          TextFieldWidget().hintTextField(
                            controller: provider.password,
                            type: type,
                            inputType: TextInputType.text,
                            hintText: "password",
                            obscure: false,
                            validator: (val) {
                              return null;
                            },
                            onChange: (val) {},
                            onSubmit: (val) {},
                            textColor: Colours().white,
                          ),
                          SizedBox(
                            height: (type == 1 ? 50 : 70).sp,
                          ),
                          SingleAlertButton(
                            type: type,
                            callB: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  DashBoardResponsive.routeName,
                                  (route) => false);
                            },
                            title: "login",
                            bottomPadding: 0,
                            horizontalPadding: 0,
                            colour: Colours().primary,
                            radius: 100,
                            fontW: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

import 'package:beonchat_admin/provider/onboarding/login_provider.dart';
import 'package:beonchat_admin/screen/onboarding/login/widget/login_form.dart';
import 'package:beonchat_admin/screen/onboarding/login/widget/login_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginWebBody extends StatelessWidget {
  const LoginWebBody({Key? key, required this.type}) : super(key: key);

  final int type;

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context2, provider, child) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: (type == 1 ? 20 : 40).sp),
        child: Row(
          children: [
            Expanded(
              child: LoginHeader(
                type: type,
              ),
            ),
            Expanded(
              child: LoginForm(
                type: type,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class LoginMobBody extends StatelessWidget {
  const LoginMobBody({Key? key, required this.type}) : super(key: key);

  final int type;

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context2, provider, child) {
      return Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoginHeader(
            type: type,
          ),
          SizedBox(
            height: 70.sp,
          ),
          LoginForm(
            type: type,
          ),
        ],
      );
    });
  }
}

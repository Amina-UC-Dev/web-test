import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/const/styles.dart';
import 'package:beonchat_admin/provider/main/main_provider.dart';
import 'package:beonchat_admin/provider/onboarding/login_provider.dart';
import 'package:beonchat_admin/screen/dashboard/dashboard_responsive.dart';
import 'package:beonchat_admin/widget/button/button.dart';
import 'package:beonchat_admin/widget/textfield/textfield.dart';
import 'package:beonchat_admin/widget/util/my_spacing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key, required this.type});

  final int type;

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context2, provider, child) {
      return Column(
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
          MySpacing.height(type == 1 ? 30 : 50),
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
          MySpacing.height(type == 1 ? 10 : 15),
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
          MySpacing.height(type == 1 ? 50 : 70),
          SingleAlertButton(
            type: type,
            callB: () {
              Provider.of<MainProvider>(context,listen: false).init();
              Navigator.pushNamedAndRemoveUntil(
                  context, DashBoardResponsive.routeName, (route) => false);
            },
            title: "login",
            bottomPadding: 0,
            horizontalPadding: 0,
            colour: Colours().primary,
            radius: 100,
            fontW: FontWeight.w400,
          ),
        ],
      );
    });
  }
}

import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/const/styles.dart';
import 'package:beonchat_admin/widget/util/my_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Loader {
  showLoader({double? size, Color? color}) {
    return Center(
      child: Image.asset(
        "assets/load.gif",
        height: size ?? 70.sp,
        color: color ?? Colours().primary,
      ),
    );
  }

  showAlertLoader({required BuildContext context, required int type}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return ScreenTypeLayout(
          mobile: const AlertLoaderBody(type: 1),
          tablet: const AlertLoaderBody(type: 2),
          desktop: const AlertLoaderBody(type: 3),
        );
      },
    );
  }

  showTransAlertLoader({required BuildContext context, required int type}) {
    return showDialog(
      context: context,
      barrierColor: Colours().trans,
      barrierDismissible: false,
      builder: (ctx) {
        return ScreenTypeLayout(
          mobile: const AlertTransLoaderBody(type: 1),
          tablet: const AlertTransLoaderBody(type: 2),
          desktop: const AlertTransLoaderBody(type: 3),
        );
      },
    );
  }
}

class AlertLoaderBody extends StatelessWidget {
  const AlertLoaderBody({Key? key, required this.type}) : super(key: key);

  final int type;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Dialog(
      backgroundColor: Colours().white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: EdgeInsets.symmetric(
        horizontal: type == 1 ? 40 : w / 5.12,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/load.gif",
                height: 60.sp,
                color: Colours().black,
              ),
              MySpacing.width(10),
              Text(
                "wait".tr,
                style: Styles().normalS(
                  fontW: FontWeight.w400,
                  color: Colours().black,
                  size: type == 1 ? 16 : 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AlertTransLoaderBody extends StatelessWidget {
  const AlertTransLoaderBody({Key? key, required this.type}) : super(key: key);

  final int type;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Dialog(
        backgroundColor: Colours().trans,
        shadowColor: Colours().trans,
        insetPadding: EdgeInsets.symmetric(
          horizontal: type == 1 ? 40 : w / 5.12,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Image.asset(
              "assets/load.gif",
              height: 45.sp,
              color: Colours().primary,
            ),
          ),
        ),
      ),
    );
  }
}

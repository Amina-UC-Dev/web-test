import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/const/styles.dart';
import 'package:beonchat_admin/const/text_size.dart';
import 'package:beonchat_admin/widget/responsive/my_responsive.dart';
import 'package:beonchat_admin/widget/util/my_spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loader {
  showLoader({double? size, Color? color}) {
    return Center(
      child: Image.asset(
        "assets/load.gif",
        height: size ?? 70,
        color: color ?? Colours().primary,
      ),
    );
  }

  showButtonLoader({required int type}) {
    return Image.asset(
      "assets/load.gif",
      color: Colours().white,
      height: type == 1 ? 25 : 32,
    );
  }

  showAlertLoader({required BuildContext context, required int type}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return MyResponsive(builder: (BuildContext context2, _, screenMT) {
          return AlertLoaderBody(
            type: screenMT.isMobile
                ? 1
                : screenMT.isTablet
                    ? 2
                    : 3,
          );
        });
      },
    );
  }

  showTransAlertLoader({required BuildContext context, required int type}) {
    return showDialog(
      context: context,
      barrierColor: Colours().trans,
      barrierDismissible: false,
      builder: (ctx) {
        return MyResponsive(builder: (BuildContext context2, _, screenMT) {
          return AlertTransLoaderBody(
            type: screenMT.isMobile
                ? 1
                : screenMT.isTablet
                    ? 2
                    : 3,
          );
        });
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
      insetPadding: MySpacing.x(
        type == 1
            ? 40
            : type == 2
                ? w / 5.12
                : w / 2.7,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: MySpacing.y(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/load.gif",
                height: 60,
                color: Colours().black,
              ),
              MySpacing.width(10),
              Text(
                "wait".tr,
                style: Styles().text(
                  textType: MyTextType.bodyMedium,
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
        insetPadding: MySpacing.x(
          type == 1 ? 40 : w / 5.12,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: MySpacing.y(10),
            child: Image.asset(
              "assets/load.gif",
              height: 45,
              color: Colours().primary,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/const/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ButtonWidget {
  button({
    double? h,
    double? w,
    required String title,
    required bool all,
    required bool left,
    required bool right,
    required int type,
    required Color color,
    required Color textColor,
    BorderSide? side,
    FontWeight? fontW,
    double? fontSize,
    double? radius,
    required Function() onTap,
  }) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      minWidth: w,
      shape: RoundedRectangleBorder(
        borderRadius: all
            ? BorderRadius.circular(radius ?? 4)
            : left
                ? BorderRadius.only(
                    topLeft: Radius.circular(radius ?? 4),
                    bottomLeft: Radius.circular(radius ?? 4),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(radius ?? 4),
                    bottomRight: Radius.circular(radius ?? 4),
                  ),
        side: side ?? BorderSide.none,
      ),
      height: h ?? (type == 1 ? 50.sp : 60.sp),
      onPressed: onTap,
      elevation: all ? 2 : 0,
      color: color,
      child: Text(
        title.tr,
        style: Styles().normalS(
          fontW: fontW ?? FontWeight.w700,
          color: textColor,
          size: fontSize ?? (type == 1 ? 16 : 18),
        ),
      ),
    );
  }

  rowButton({
    required int type,
    required String title1,
    required String title2,
    required Function() callB1,
    required Function() callB2,
  }) {
    return SizedBox(
      height: type == 1 ? 50.sp : 60.sp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ButtonWidget().button(
              textColor: Colours().white,
              type: type,
              title: title1,
              all: false,
              left: Get.locale!.languageCode == "ar" ? false : true,
              right: Get.locale!.languageCode == "ar" ? true : false,
              onTap: callB1,
              color: Colours().black,
            ),
          ),
          Container(
            width: 1,
          ),
          Expanded(
            child: ButtonWidget().button(
              textColor: Colours().white,
              type: type,
              title: title2,
              all: false,
              left: Get.locale!.languageCode == "ar" ? true : false,
              right: Get.locale!.languageCode == "ar" ? false : true,
              onTap: callB2,
              color: Colours().black,
            ),
          ),
        ],
      ),
    );
  }
}

class SingleButton extends StatelessWidget {
  const SingleButton(
      {Key? key,
      required this.type,
      required this.callB,
      required this.title,
      this.color,
      this.textColor,
      this.fontW})
      : super(key: key);

  final int type;
  final String title;
  final Function() callB;
  final Color? color;
  final Color? textColor;
  final FontWeight? fontW;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        top: 10.sp,
        bottom: 35.sp,
        left: type == 1 ? 40.sp : (w / 3.7).sp,
        right: type == 1 ? 40.sp : (w / 3.7).sp,
      ),
      child: SizedBox(
        height: 50.sp,
        child: Center(
          child: ButtonWidget().button(
            textColor: textColor ?? Colours().white,
            type: type,
            w: w,
            title: title.tr,
            all: true,
            left: false,
            right: false,
            onTap: callB,
            color: color ?? Colours().black,
            fontW: fontW,
          ),
        ),
      ),
    );
  }
}

class SingleAlertButton extends StatelessWidget {
  const SingleAlertButton(
      {Key? key,
      required this.type,
      required this.callB,
      required this.title,
      required this.bottomPadding,
      this.colour,
      required this.horizontalPadding,
      this.fontW,
      this.fontSize, this.radius})
      : super(key: key);

  final int type;
  final String title;
  final double bottomPadding, horizontalPadding;
  final double? fontSize;
  final Color? colour;
  final FontWeight? fontW;
  final double? radius;
  final Function() callB;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        bottom: bottomPadding.sp,
        left: horizontalPadding.sp,
        right: horizontalPadding.sp,
      ),
      child: SizedBox(
        height: type == 1 ? 50.sp : 60.sp,
        child: Center(
          child: ButtonWidget().button(
            textColor: Colours().white,
            type: type,
            w: w,
            title: title.tr,
            all: true,
            left: false,
            right: false,
            onTap: callB,
            color: colour ?? Colours().black,
            fontW: fontW,
            fontSize: fontSize,
            radius: radius,
          ),
        ),
      ),
    );
  }
}

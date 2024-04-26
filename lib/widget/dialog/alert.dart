import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/const/styles.dart';
import 'package:beonchat_admin/const/text_size.dart';
import 'package:beonchat_admin/widget/util/my_button.dart';
import 'package:beonchat_admin/widget/util/my_spacing.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AlertWidget {
  show({required BuildContext context, required bool dark, String? title, required String message}) {
    title = title ?? 'alert';

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          title: Text(title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Styles().text(
                textType: MyTextType.labelLarge,
                color: Colours().appBarOnBgColor(dark),
                fontW: FontWeight.w600,
                size: 16,
              )),
          content: SizedBox(
            width: 400,
            child: Text(message,
                style: Styles().text(
                  textType: MyTextType.bodySmall,
                  color: Colours().appBarOnBgColor(dark),
                  fontW: FontWeight.w400,
                  size: 14,
                )),
          ),
          actions: [
            MyButton.rounded(
              onPressed: () {
                Navigator.pop(context);
              },
              elevation: 0,
              padding: MySpacing.xy(20, 16),
              backgroundColor: Colours().blue,
              child: Text("close",
                  style: Styles().text(
                    textType: MyTextType.labelMedium,
                    color: Colours().white,
                    fontW: FontWeight.w400,
                    size: 13,
                  )),
            ),
          ],
        );
      },
    );
  }
}

class ConfirmWidget {
  show({
    required BuildContext context,
    required bool dark,
    String? title,
    required String message,
    String? buttonTextTrue,
    String? buttonTextFalse,
    required Function() funcTrue,
  }) {
    title = title ?? 'alert';
    buttonTextTrue = buttonTextTrue ?? 'yes';
    buttonTextFalse = buttonTextFalse ?? 'no';

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          title: Text(title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Styles().text(
                textType: MyTextType.labelLarge,
                color: Colours().appBarOnBgColor(dark),
                fontW: FontWeight.w600,
                size: 16,
              )),
          content: SizedBox(
            width: 400,
            child: Text(message,
                style: Styles().text(
                  textType: MyTextType.bodySmall,
                  color: Colours().appBarOnBgColor(dark),
                  fontW: FontWeight.w400,
                  size: 14,
                )),
          ),
          actions: [
            MyButton.rounded(
              onPressed: () {
                Navigator.pop(context);
              },
              elevation: 0,
              padding: MySpacing.xy(20, 16),
              backgroundColor: Colours().grey4,
              child: Text(buttonTextFalse!,
                  style: Styles().text(
                    textType: MyTextType.labelMedium,
                    color: Colours().black,
                    fontW: FontWeight.w400,
                    size: 13,
                  )),
            ),
            MyButton.rounded(
              onPressed: funcTrue,
              elevation: 0,
              padding: MySpacing.xy(20, 16),
              backgroundColor: Colours().blue,
              child: Text(buttonTextTrue!,
                  style: Styles().text(
                    textType: MyTextType.labelMedium,
                    color: Colours().white,
                    fontW: FontWeight.w400,
                    size: 13,
                  )),
            ),
          ],
        );
      },
    );
  }
}

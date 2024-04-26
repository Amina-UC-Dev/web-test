import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/const/styles.dart';
import 'package:beonchat_admin/const/text_size.dart';
import 'package:beonchat_admin/widget/responsive/responsive.dart';
import 'package:beonchat_admin/widget/util/my_button.dart';
import 'package:beonchat_admin/widget/util/my_spacing.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DialogWidget {
  show({required BuildContext context, required bool dark, String? title, required Column content, String? size}) {
    title = title ?? 'alert';
    size = size ?? 'medium';

    double sizeDialog = 850;

    if (size=="sm") {
      sizeDialog = 300;
    }else if (size=="lg"){
      sizeDialog = 950;
    }else if (size=="xl"){
      sizeDialog = 1150;
    }
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return Dialog(
          child: SizedBox(
            width: sizeDialog,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: MySpacing.all(16),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(title!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Styles().text(
                                textType: MyTextType.labelLarge,
                                color: Colours().appBarOnBgColor(dark),
                                fontW: FontWeight.w600,
                                size: 16,
                              ))),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          LucideIcons.x,
                          size: 20,
                          color: Colours().grey3,
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(height: 0, thickness: 1),
                Padding(
                  padding: MySpacing.all(16),
                  child: content,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/const/styles.dart';
import 'package:beonchat_admin/const/text_size.dart';
import 'package:beonchat_admin/provider/app_theme/app_theme_provider.dart';
import 'package:beonchat_admin/widget/util/my_button.dart';
import 'package:beonchat_admin/widget/util/my_container.dart';
import 'package:beonchat_admin/widget/util/my_dashed_divider.dart';
import 'package:beonchat_admin/widget/util/my_spacing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildNotifications(BuildContext context) {
  Widget buildNotification(String title, String description, bool dark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Styles().text(
            textType: MyTextType.labelLarge,
            color: dark ? Colours().white : Colours().black,
          ),
        ),
        MySpacing.height(4),
        Text(
          description,
          style: Styles().text(
            textType: MyTextType.bodySmall,
            color: dark ? Colours().white : Colours().black,
          ),
        ),
      ],
    );
  }

  return Consumer<AppThemeProvider>(builder: (_, themePro, ___) {
    return MyContainer.bordered(
      paddingAll: 0,
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: MySpacing.xy(16, 12),
            child: Text(
              "Notification",
              style: Styles().text(
                  textType: MyTextType.titleMedium,
                  color: themePro.darkTheme ? Colours().white : Colours().black,
                  fontW: FontWeight.w600),
            ),
          ),
          MyDashedDivider(
              height: 1,
              color: Colours().dividerColor(themePro.darkTheme),
              dashSpace: 4,
              dashWidth: 6),
          Padding(
            padding: MySpacing.xy(16, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildNotification("Your order is received",
                    "Order #1232 is ready to deliver", themePro.darkTheme),
                MySpacing.height(12),
                buildNotification(
                    "Account Security ",
                    "Your account password changed 1 hour ago",
                    themePro.darkTheme),
              ],
            ),
          ),
          MyDashedDivider(
              height: 1,
              color: Colours().dividerColor(themePro.darkTheme),
              dashSpace: 4,
              dashWidth: 6),
          Padding(
            padding: MySpacing.x(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton.text(
                  onPressed: () {},
                  splashColor: Colours().primary.withAlpha(28),
                  child: Text(
                    "View All",
                    style: Styles().text(
                      textType: MyTextType.labelSmall,
                      color: Colours().primary,
                    ),
                  ),
                ),
                MyButton.text(
                  onPressed: () {},
                  splashColor: Colours().red2.withAlpha(28),
                  child: Text(
                    "Clear",
                    style: Styles().text(
                      textType: MyTextType.labelSmall,
                      color: Colours().red2,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  });
}

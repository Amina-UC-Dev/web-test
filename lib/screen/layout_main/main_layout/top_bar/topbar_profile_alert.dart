import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/const/styles.dart';
import 'package:beonchat_admin/const/text_size.dart';
import 'package:beonchat_admin/provider/app_theme/app_theme_provider.dart';
import 'package:beonchat_admin/widget/util/my_button.dart';
import 'package:beonchat_admin/widget/util/my_container.dart';
import 'package:beonchat_admin/widget/util/my_spacing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildAccountMenu(BuildContext context) {
  return Consumer<AppThemeProvider>(builder: (_, themePro, ___) {
    return MyContainer.bordered(
      paddingAll: 0,
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: MySpacing.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyButton(
                  onPressed: () {},
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  borderRadiusAll: 4,
                  padding: MySpacing.xy(8, 4),
                  splashColor:
                      ThemeData().colorScheme.onBackground.withAlpha(20),
                  backgroundColor: Colors.transparent,
                  child: Row(
                    children: [
                      Icon(
                        Icons.person_outline_rounded,
                        size: 14,
                        color: themePro.darkTheme
                            ? Colours().white
                            : Colours().black,
                      ),
                      MySpacing.width(8),
                      Text(
                        "My Profile",
                        style: Styles().text(
                            textType: MyTextType.labelMedium,
                            color: themePro.darkTheme
                                ? Colours().white
                                : Colours().black,
                            fontW: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                MySpacing.height(4),
                MyButton(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: () {},
                  borderRadiusAll: 4,
                  padding: MySpacing.xy(8, 4),
                  splashColor:
                      ThemeData().colorScheme.onBackground.withAlpha(20),
                  backgroundColor: Colors.transparent,
                  child: Row(
                    children: [
                      Icon(
                        Icons.note_alt_outlined,
                        size: 14,
                        color: themePro.darkTheme
                            ? Colours().white
                            : Colours().black,
                      ),
                      MySpacing.width(8),
                      Text(
                        "Edit Profile",
                        style: Styles().text(
                            textType: MyTextType.labelMedium,
                            color: themePro.darkTheme
                                ? Colours().white
                                : Colours().black,
                            fontW: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          Padding(
            padding: MySpacing.all(8),
            child: MyButton(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () {},
              borderRadiusAll: 4,
              padding: MySpacing.xy(8, 4),
              splashColor: Colours().red2.withAlpha(28),
              backgroundColor: Colors.transparent,
              child: Row(
                children: [
                  Icon(
                    Icons.logout_rounded,
                    size: 14,
                    color:
                        themePro.darkTheme ? Colours().white : Colours().black,
                  ),
                  MySpacing.width(8),
                  Text(
                    "Log out",
                    style: Styles().text(
                        textType: MyTextType.labelMedium,
                        color: themePro.darkTheme
                            ? Colours().white
                            : Colours().black,
                        fontW: FontWeight.w600),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  });
}

import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/const/styles.dart';
import 'package:beonchat_admin/const/text_size.dart';
import 'package:beonchat_admin/const/utils.dart';
import 'package:beonchat_admin/provider/app_theme/app_theme_provider.dart';
import 'package:beonchat_admin/provider/main/main_provider.dart';
import 'package:beonchat_admin/screen/layout_main/main_layout/top_bar/topbar_notification_alert.dart';
import 'package:beonchat_admin/screen/layout_main/main_layout/top_bar/topbar_profile_alert.dart';
import 'package:beonchat_admin/widget/util/custom_pop_menu.dart';
import 'package:beonchat_admin/widget/util/my_card.dart';
import 'package:beonchat_admin/widget/util/my_container.dart';
import 'package:beonchat_admin/widget/util/my_shadow.dart';
import 'package:beonchat_admin/widget/util/my_spacing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainTopBar extends StatelessWidget {
  const MainTopBar({super.key, required this.mobile});

  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context2, mainPro, child) {
        return Consumer<AppThemeProvider>(
          builder: (context2, theme, child) {
            return MyCard(
              shadow: MyShadow(
                  position: MyShadowPosition.bottomRight, elevation: 0.5),
              height: 60,
              borderRadiusAll: 0,
              padding: MySpacing.x(24),
              color: Colours().appBarBgColor(theme.darkTheme),
              child: Row(
                children: [
                  Row(
                    children: [
                      InkWell(
                        splashColor: ThemeData().colorScheme.onBackground,
                        highlightColor: ThemeData().colorScheme.onBackground,
                        onTap: () {
                          mainPro.updateDrawer();
                        },
                        child: Icon(
                          Icons.menu,
                          color: Colours().appBarOnBgColor(theme.darkTheme),
                        ),
                      ),
                      MySpacing.width(24),
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          maxLines: 1,
                          style: Styles().text(
                            textType: MyTextType.bodyMedium,
                            color: theme.darkTheme
                                ? Colours().white
                                : Colours().black,
                          ),
                          decoration: InputDecoration(
                              hintText: "search",
                              hintStyle: Styles().text(
                                textType: MyTextType.bodySmall,
                                color: Colours().grey,
                              ),
                              border: UtilsWidget().getOutLineBorder(
                                  theme.darkTheme, Colours().grey),
                              enabledBorder: UtilsWidget().getOutLineBorder(
                                  theme.darkTheme, Colours().grey),
                              focusedBorder: UtilsWidget().getOutLineBorder(
                                  theme.darkTheme, Colours().primary),
                              prefixIcon: const Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.search_rounded,
                                  size: 14,
                                ),
                              ),
                              prefixIconConstraints: const BoxConstraints(
                                  minWidth: 36,
                                  maxWidth: 36,
                                  minHeight: 32,
                                  maxHeight: 32),
                              contentPadding: MySpacing.xy(16, 12),
                              isCollapsed: true,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: MainAppBarActions(
                      mobile: mobile,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class MainAppBarActions extends StatelessWidget {
  const MainAppBarActions({super.key, required this.mobile});

  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeProvider>(builder: (context2, theme, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () async {
              theme.darkTheme = !theme.darkTheme;
              await theme.darkThemePreference.getBool(key: "theme");
            },
            child: Icon(
              theme.darkTheme
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
              size: mobile ? 18 : null,
              color: Colours().appBarOnBgColor(theme.darkTheme),
            ),
          ),
          MySpacing.width(mobile ? 8 : 12),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: CustomPopupMenu(
              backdrop: true,
              onChange: (_) {},
              offsetX: mobile ? -149 : -120,
              menu: Padding(
                padding: MySpacing.all(8),
                child: Center(
                  child: Icon(
                    Icons.notifications_none_rounded,
                    size: mobile ? 18 : null,
                    color: Colours().appBarOnBgColor(theme.darkTheme),
                  ),
                ),
              ),
              menuBuilder: (_) => buildNotifications(context),
            ),
          ),
          MySpacing.width(mobile ? 8 : 4),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: CustomPopupMenu(
              backdrop: true,
              onChange: (_) {},
              offsetX: mobile ? -90 : -60,
              offsetY: mobile ? 4 : 8,
              menu: Padding(
                padding: MySpacing.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyContainer.rounded(
                      paddingAll: 0,
                      child: Image.asset(
                        "assets/image/profile_image.jpg",
                        height: 28,
                        width: 28,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (!mobile) MySpacing.width(8),
                    if (!mobile)
                      Text(
                        "Den",
                        style: Styles().text(
                          textType: MyTextType.labelLarge,
                          color: Colours().appBarOnBgColor(theme.darkTheme),
                        ),
                      )
                  ],
                ),
              ),
              menuBuilder: (_) => buildAccountMenu(context),
            ),
          ),
          MySpacing.width(mobile ? 20 : 0)
        ],
      );
    });
  }
}

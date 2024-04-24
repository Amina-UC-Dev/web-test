import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/provider/app_theme/app_theme_provider.dart';
import 'package:beonchat_admin/provider/main/main_provider.dart';
import 'package:beonchat_admin/screen/layout_main/main_layout/left_bar/multi_nav.dart';
import 'package:beonchat_admin/screen/layout_main/main_layout/left_bar/nav.dart';
import 'package:beonchat_admin/screen/layout_main/main_layout/left_bar/nav_header.dart';
import 'package:beonchat_admin/widget/logo/logo.dart';
import 'package:beonchat_admin/widget/util/my_card.dart';
import 'package:beonchat_admin/widget/util/my_shadow.dart';
import 'package:beonchat_admin/widget/util/my_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SideNavigationBar extends StatelessWidget {
  const SideNavigationBar({super.key, required this.mobile});

  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context2, mainPro, child) {
        return Consumer<AppThemeProvider>(
          builder: (context2, theme, child) {
            return MyCard(
              paddingAll: 0,
              shadow: MyShadow(
                  position: MyShadowPosition.centerRight, elevation: 0.2),
              child: AnimatedContainer(
                color: Colours().drawerBgColor(theme.darkTheme),
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 200),
                width: mainPro.minimizeDrawer ? 70 : 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/image/logo.svg",
                            height: mainPro.minimizeDrawer ? 24 : 32,
                          ),
                          if (!mainPro.minimizeDrawer)
                            Flexible(
                                fit: FlexFit.loose, child: MySpacing.width(10)),
                          if (!mainPro.minimizeDrawer)
                            Flexible(
                              fit: FlexFit.loose,
                              child: LogoText(
                                size: 28,
                                space: -3,
                                color: theme.darkTheme
                                    ? Colours().white
                                    : Colours().ternary,
                              ),
                            ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: mainPro.scrollController,
                        // physics: const PageScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0; i < mainPro.navigation.length; i++)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  NavHeader(
                                    title: mainPro.navigation[i].title,
                                    dark: theme.darkTheme,
                                    hide: mainPro.minimizeDrawer,
                                  ),
                                  for (int j = 0;
                                      j < mainPro.navigation[i].items.length;
                                      j++)
                                    Column(
                                      children: [
                                        if (mainPro.navigation[i].items[j]
                                            .subItems.isNotEmpty)
                                          MultiNav(
                                            data:
                                                mainPro.navigation[i].items[j],
                                            dark: theme.darkTheme,
                                            hide: mainPro.minimizeDrawer,
                                            i: i,
                                            j: j,
                                          )
                                        else
                                          InkWell(
                                            onHover: (val) {
                                              mainPro.updateHover(i, j, val);
                                            },
                                            onTap: () {
                                              mainPro.updateNavigation(
                                                  i, j, null);
                                            },
                                            child: NavTile(
                                              data: mainPro
                                                  .navigation[i].items[j],
                                              dark: theme.darkTheme,
                                              hide: mainPro.minimizeDrawer,
                                            ),
                                          ),
                                      ],
                                    ),
                                ],
                              ),
                            MySpacing.height(50),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

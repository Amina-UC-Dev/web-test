import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/const/styles.dart';
import 'package:beonchat_admin/const/text_size.dart';
import 'package:beonchat_admin/provider/app_theme/app_theme_provider.dart';
import 'package:beonchat_admin/provider/dashboard/dashboard_provider.dart';
import 'package:beonchat_admin/screen/layout_main/main_layout/layout.dart';
import 'package:beonchat_admin/widget/responsive/my_flex.dart';
import 'package:beonchat_admin/widget/responsive/my_flex_item.dart';
import 'package:beonchat_admin/widget/responsive/responsive.dart';
import 'package:beonchat_admin/widget/util/my_card.dart';
import 'package:beonchat_admin/widget/util/my_container.dart';
import 'package:beonchat_admin/widget/util/my_shadow.dart';
import 'package:beonchat_admin/widget/util/my_spacing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key, required this.type}) : super(key: key);

  final int type;

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardProvider>(builder: (_, dashPro, __) {
      return Consumer<AppThemeProvider>(builder: (_, themePro, __) {
        return Layout(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: flexSpacing),
                child: Text(
                  "Dashboard",
                  style: Styles().text(
                    textType: MyTextType.titleMedium,
                    color: Colours().appBarOnBgColor(themePro.darkTheme),
                    fontW: FontWeight.w600,
                    size: 18,
                  ),
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: flexSpacing / 2),
                child: MyFlex(
                  runAlignment: WrapAlignment.start,
                  wrapCrossAlignment: WrapCrossAlignment.start,
                  // contentPadding: false,
                  children: [
                    MyFlexItem(
                      sizes: "lg-12",
                      child: MyFlex(
                        runAlignment: WrapAlignment.start,
                        wrapCrossAlignment: WrapCrossAlignment.start,
                        contentPadding: false,
                        children: [
                          MyFlexItem(
                            sizes: "lg-2",
                            child: buildCard(
                              Colours().pink,
                              Icons.groups,
                              "total user profiles",
                              "710",
                              Icons.trending_up,
                              Colours().success,
                              "1.25",
                              "Last Month",
                              themePro.darkTheme,
                            ),
                          ),
                          MyFlexItem(
                            sizes: "lg-2",
                            child: buildCard(
                              Colours().primary,
                              Icons.home_work_rounded,
                              "total companies",
                              "878",
                              Icons.trending_down,
                              Colours().red,
                              "2.5",
                              "Last Week",
                              themePro.darkTheme,
                            ),
                          ),
                          MyFlexItem(
                            sizes: "lg-2",
                            child: buildCard(
                              Colours().success,
                              Icons.people_sharp,
                              "total user reg",
                              "0",
                              Icons.trending_down,
                              Colours().red,
                              "1.23",
                              "Last Month",
                              themePro.darkTheme,
                            ),
                          ),
                          MyFlexItem(
                            sizes: "lg-2",
                            child: buildCard(
                              Colours().warning,
                             Icons.contact_mail_rounded,
                              "total company reg",
                              "0",
                              Icons.trending_up,
                              Colours().success,
                              "0.2",
                              "Last Day",
                              themePro.darkTheme,
                            ),
                          ),
                          MyFlexItem(
                            sizes: "lg-2",
                            child: buildCard(
                              Colours().blue,
                              Icons.pending_actions_outlined,
                              "pending user profile",
                              "384",
                              Icons.trending_up,
                              Colours().success,
                              "0.2",
                              "Last Day",
                              themePro.darkTheme,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      });
    });
  }

  Widget buildCard(
    Color color,
    IconData icons,
    String accountType,
    String price,
    IconData trendingIcon,
    Color trendingIconColor,
    String percentage,
    String month,
    bool dark,
  ) {
    return MyCard(
      shadow: MyShadow(elevation: 0.5),
      height: 140,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  accountType.toUpperCase(),
                  style: Styles().text(
                    textType: MyTextType.bodyLarge,
                    color: Colours().appBarOnBgColor(dark),
                    fontW: FontWeight.w600,
                    size: 15,
                  ),
                ),
                Text(
                  price,
                  style: Styles().text(
                    textType: MyTextType.bodyLarge,
                    color: Colours().appBarOnBgColor(dark),
                    fontW: FontWeight.w600,
                    size: 20,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      trendingIcon,
                      color: trendingIconColor,
                      size: 16,
                    ),
                    MySpacing.width(8),
                    Text(
                      "$percentage%",
                      style: Styles().text(
                        textType: MyTextType.bodyMedium,
                        color: Colours().appBarOnBgColor(dark),
                      ),
                    ),
                    MySpacing.width(8),
                    Text(
                      month,
                      style: Styles().text(
                        textType: MyTextType.bodyMedium,
                        color: Colours().appBarOnBgColor(dark),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          MyContainer(
            height: 70,
            width: 70,
            paddingAll: 0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: color.withAlpha(30),
            child: Icon(
              icons,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/const/styles.dart';
import 'package:beonchat_admin/const/text_size.dart';
import 'package:beonchat_admin/provider/app_theme/app_theme_provider.dart';
import 'package:beonchat_admin/provider/dashboard/dashboard_provider.dart';
import 'package:beonchat_admin/screen/dashboard/widget/dashboard_widgets.dart';
import 'package:beonchat_admin/screen/layout_main/main_layout/layout.dart';
import 'package:beonchat_admin/widget/responsive/my_flex.dart';
import 'package:beonchat_admin/widget/responsive/my_flex_item.dart';
import 'package:beonchat_admin/widget/responsive/responsive.dart';
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

              // PROIFLE COUNTERS
              MySpacing.height(flexSpacing),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: flexSpacing),
                child: DashboardProfileCountersWidget(),
              ),

              // CAMPAIGN + ACTIVE USERS
              MySpacing.height(flexSpacing),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: flexSpacing),
                child: MyFlex(
                  runAlignment: WrapAlignment.start,
                  wrapCrossAlignment: WrapCrossAlignment.start,
                  contentPadding: false,
                  children: [
                    MyFlexItem(
                      sizes: "lg-6",
                      child: DashboardCampaignReportWidget(dark: themePro.darkTheme),
                    ),
                    MyFlexItem(
                      sizes: "lg-6",
                      child: DashboardActiveUsersWidget(dark: themePro.darkTheme),
                    )
                  ],
                ),
              ),

              // TODAY USER + COMPANY REGISTERED
              MySpacing.height(flexSpacing),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: flexSpacing),
                child: MyFlex(
                  runAlignment: WrapAlignment.start,
                  wrapCrossAlignment: WrapCrossAlignment.start,
                  contentPadding: false,
                  children: [
                    MyFlexItem(
                      sizes: "lg-6",
                      child: DashboardTodayUserRegisteredWidget(dark: themePro.darkTheme),
                    ),
                    MyFlexItem(
                      sizes: "lg-6",
                      child: DashboardCompanyRegisteredWidget(dark: themePro.darkTheme),
                    )
                  ],
                ),
              ),

              // PENDING USER + COMPANY REGISTERED
              MySpacing.height(flexSpacing),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: flexSpacing),
                child: MyFlex(
                  runAlignment: WrapAlignment.start,
                  wrapCrossAlignment: WrapCrossAlignment.start,
                  contentPadding: false,
                  children: [
                    MyFlexItem(
                      sizes: "lg-6",
                      child: DashboardPendingUserWidget(dark: themePro.darkTheme),
                    ),
                    MyFlexItem(
                      sizes: "lg-6",
                      child: DashboardPendingCompanyWidget(dark: themePro.darkTheme),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      });
    });
  }
}

import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/const/styles.dart';
import 'package:beonchat_admin/const/text_size.dart';
import 'package:beonchat_admin/widget/table/table.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:beonchat_admin/model/dashboard/dashboard_all_model.dart';
import 'package:beonchat_admin/provider/app_theme/app_theme_provider.dart';
import 'package:beonchat_admin/provider/dashboard/dashboard_provider.dart';
import 'package:beonchat_admin/widget/responsive/my_flex.dart';
import 'package:beonchat_admin/widget/responsive/my_flex_item.dart';
import 'package:beonchat_admin/widget/responsive/my_list_extension.dart';
import 'package:beonchat_admin/widget/responsive/responsive.dart';
import 'package:beonchat_admin/widget/util/my_card.dart';
import 'package:beonchat_admin/widget/util/my_container.dart';
import 'package:beonchat_admin/widget/util/my_shadow.dart';
import 'package:beonchat_admin/widget/util/my_spacing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardCampaignReportWidget extends StatelessWidget {
  const DashboardCampaignReportWidget({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardProvider>(builder: (_, dashPro, __) {
      return MyCard(
        shadow: MyShadow(elevation: 0.5),
        paddingAll: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: MySpacing.all(16),
              child: Text(
                'Campaign Report',
                style: Styles().text(
                  textType: MyTextType.titleMedium,
                  color: Colours().appBarOnBgColor(dark),
                  fontW: FontWeight.w600,
                  size: 15,
                ),
              ),
            ),
            const Divider(),
            MySpacing.height(12),
            Padding(
              padding: MySpacing.x(20),
              child: SfCartesianChart(
                //title: ChartTitle(text: 'Campaign Report'),
                plotAreaBorderWidth: 0,
                legend: Legend(isVisible: true, position: LegendPosition.top),

                /// X axis as numeric axis placed here.
                primaryXAxis: NumericAxis(
                    //title: AxisTitle(text: 'Match'),
                    minimum: 0,
                    maximum: 6,
                    interval: 1,
                    majorGridLines: const MajorGridLines(width: 0),
                    majorTickLines: const MajorTickLines(size: 0),
                    edgeLabelPlacement: EdgeLabelPlacement.hide),
                primaryYAxis: NumericAxis(
                  //title: AxisTitle(text: 'Score'),
                  axisLine: const AxisLine(width: 0),
                  majorTickLines: const MajorTickLines(size: 0),
                ),
                series: getDefaultNumericSeries(
                    dashPro.dashboarChartCampaignReport),
                tooltipBehavior: TooltipBehavior(
                    enable: true,
                    format: 'Score: point.y',
                    canShowMarker: false),
              ),
            ),
            MySpacing.height(12),
            Padding(
              padding: MySpacing.x(50),
              child: MyFlex(
                runAlignment: WrapAlignment.start,
                wrapCrossAlignment: WrapCrossAlignment.start,
                contentPadding: false,
                spacing: 0,
                runSpacing: 0,
                children: [
                  for (int num = 1; num <= 5; num++)
                    MyFlexItem(
                      sizes: "lg-6",
                      child: Text(
                        "${num} - name here",
                        style: Styles().text(
                          textType: MyTextType.titleMedium,
                          color: Colours().appBarOnBgColor(dark),
                          fontW: FontWeight.w400,
                          size: 12,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            MySpacing.height(40),
          ],
        ),
      );
    });
  }

  List<ColumnSeries<DashboarChartCampaignReport, num>> getDefaultNumericSeries(
      List<DashboarChartCampaignReport> listData) {
    return <ColumnSeries<DashboarChartCampaignReport, num>>[
      // clicks
      ColumnSeries<DashboarChartCampaignReport, num>(
          name: 'clicks',
          dataSource: listData,
          color: const Color.fromRGBO(78, 115, 223, 1),
          xValueMapper: (DashboarChartCampaignReport campaign, _) =>
              campaign.xId as num,
          yValueMapper: (DashboarChartCampaignReport campaign, _) =>
              campaign.clicks),

      // user signup
      ColumnSeries<DashboarChartCampaignReport, num>(
        name: 'user signup',
        dataSource: listData,
        color: const Color.fromRGBO(28, 200, 138, 1),
        xValueMapper: (DashboarChartCampaignReport campaign, _) =>
            campaign.xId as num,
        yValueMapper: (DashboarChartCampaignReport campaign, _) =>
            campaign.usersignup,
      ),

      // company signup
      ColumnSeries<DashboarChartCampaignReport, num>(
        name: 'company signup',
        dataSource: listData,
        color: const Color.fromRGBO(54, 185, 204, 1),
        xValueMapper: (DashboarChartCampaignReport campaign, _) =>
            campaign.xId as num,
        yValueMapper: (DashboarChartCampaignReport campaign, _) =>
            campaign.companysignup,
      ),

      // app downloads
      ColumnSeries<DashboarChartCampaignReport, num>(
        name: 'app downloads',
        dataSource: listData,
        color: const Color.fromRGBO(246, 194, 62, 1),
        xValueMapper: (DashboarChartCampaignReport campaign, _) =>
            campaign.xId as num,
        yValueMapper: (DashboarChartCampaignReport campaign, _) =>
            campaign.appdownloads,
      ),
    ];
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
class DashboardActiveUsersWidget extends StatelessWidget {
  const DashboardActiveUsersWidget({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardProvider>(builder: (_, dashPro, __) {
      return MyCard(
        shadow: MyShadow(elevation: 0.5),
        paddingAll: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: MySpacing.all(16),
              child: Text(
                'Active Users (last 7days)',
                style: Styles().text(
                  textType: MyTextType.titleMedium,
                  color: Colours().appBarOnBgColor(dark),
                  fontW: FontWeight.w600,
                  size: 15,
                ),
              ),
            ),
            const Divider(),
            MySpacing.height(12),
            MyFlex(
              runAlignment: WrapAlignment.start,
              wrapCrossAlignment: WrapCrossAlignment.start,
              contentPadding: false,
              children: [
                MyFlexItem(
                  sizes: "lg-6",
                  child: SfCircularChart(
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <CircularSeries>[
                      DoughnutSeries<DashboardChartActiveUsers, String>(
                          radius: '100%',
                          explode: true,
                          explodeOffset: '10%',
                          dataSource: dashPro.dashboardChartActiveUsers,
                          pointColorMapper:
                              (DashboardChartActiveUsers data, _) =>
                                  data.pointColor,
                          xValueMapper: (DashboardChartActiveUsers data, _) =>
                              data.name,
                          yValueMapper: (DashboardChartActiveUsers data, _) =>
                              data.counter,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true)),
                    ],
                  ),
                ),
                MyFlexItem(
                  sizes: "lg-6",
                  child: Padding(
                    padding: MySpacing.x(50),
                    child: Column(
                      children: [
                        MySpacing.height(12),
                        buildCircleChartData(
                            const Color.fromRGBO(9, 143, 251, 1), "ios", dark),
                        MySpacing.height(8),
                        buildCircleChartData(
                            const Color.fromRGBO(0, 227, 150, 1),
                            "android",
                            dark),
                        MySpacing.height(8),
                        buildCircleChartData(
                            const Color.fromRGBO(254, 176, 25, 1),
                            "huawei",
                            dark),
                        MySpacing.height(8),
                        buildCircleChartData(
                            const Color.fromRGBO(225, 69, 96, 1), "web", dark),
                      ],
                    ),
                  ),
                )
              ],
            ),
            MySpacing.height(40),
          ],
        ),
      );
    });
  }
}

Widget buildCircleChartData(Color color, String title, bool dark) {
  return Row(
    children: [
      MyContainer.rounded(
        paddingAll: 4,
        color: color,
      ),
      MySpacing.width(8),
      TableRowContent(width: null, label: title, dark: dark)
    ],
  );
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
class DashboardTodayUserRegisteredWidget extends StatelessWidget {
  const DashboardTodayUserRegisteredWidget({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardProvider>(builder: (_, dashPro, __) {
      return MyCard(
        shadow: MyShadow(elevation: 0.5),
        paddingAll: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: MySpacing.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today User Registered',
                    style: Styles().text(
                      textType: MyTextType.titleMedium,
                      color: Colours().appBarOnBgColor(dark),
                      fontW: FontWeight.w600,
                      size: 15,
                    ),
                  ),
                  Text(
                    '10',
                    style: Styles().text(
                      textType: MyTextType.titleMedium,
                      color: Colours().appBarOnBgColor(dark),
                      fontW: FontWeight.w600,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            MySpacing.height(12),
            Center(
              child: Padding(
                padding: MySpacing.fromLTRB(16, 10, 16, 35),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: MyContainer.bordered(
                    paddingAll: 0,
                    child: DataTable(
                        sortAscending: true,
                        onSelectAll: (_) => {},
                        headingRowColor: MaterialStatePropertyAll(
                            Colours().appBarOnBgColor(!dark)),
                        dataRowHeight: 50,
                        columnSpacing: 35,
                        columns: [
                          DataColumn(label: TableRowHead(label: "logo", dark: dark)),
                          DataColumn(label: TableRowHead(label: "name", dark: dark)),
                          DataColumn(label: TableRowHead(label: "location", dark: dark)),
                          DataColumn(label: TableRowHead(label: "date", dark: dark)),
                        ],
                        rows: dashPro.dashboardProfiles
                            .mapIndexed(
                              (index, data) => DataRow(
                                cells: [
                                  DataCell(
                                    MyContainer(
                                        paddingAll: 0,
                                        borderRadiusAll: 22,
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        child: Image.network(data.logo, height: 30, width: 30, fit: BoxFit.cover)),
                                  ),
                                  DataCell(TableRowContent(width: null, label: data.name, dark: dark)),
                                  DataCell(TableRowContent(width: 300, label: data.location, dark: dark)),
                                  DataCell(TableRowContent(width: null, label: data.date, dark: dark)),
                                ],
                              ),
                            )
                            .toList()),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
class DashboardCompanyRegisteredWidget extends StatelessWidget {
  const DashboardCompanyRegisteredWidget({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardProvider>(builder: (_, dashPro, __) {
      return MyCard(
        shadow: MyShadow(elevation: 0.5),
        paddingAll: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: MySpacing.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today Company Registered',
                    style: Styles().text(
                      textType: MyTextType.titleMedium,
                      color: Colours().appBarOnBgColor(dark),
                      fontW: FontWeight.w600,
                      size: 15,
                    ),
                  ),
                  Text(
                    '25',
                    style: Styles().text(
                      textType: MyTextType.titleMedium,
                      color: Colours().appBarOnBgColor(dark),
                      fontW: FontWeight.w600,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            MySpacing.height(12),
            Center(
              child: Padding(
                padding: MySpacing.fromLTRB(16, 10, 16, 35),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: MyContainer.bordered(
                    paddingAll: 0,
                    child: DataTable(
                        sortAscending: true,
                        onSelectAll: (_) => {},
                        headingRowColor: MaterialStatePropertyAll(
                            Colours().appBarOnBgColor(!dark)),
                        dataRowHeight: 50,
                        columnSpacing: 35,
                        columns: [
                          DataColumn(label: TableRowHead(label: "logo", dark: dark)),
                          DataColumn(label: TableRowHead(label: "name", dark: dark)),
                          DataColumn(label: TableRowHead(label: "location", dark: dark)),
                          DataColumn(label: TableRowHead(label: "date", dark: dark)),
                        ],
                        rows: dashPro.dashboardProfiles
                            .mapIndexed(
                              (index, data) => DataRow(
                                cells: [
                                  DataCell(
                                    MyContainer(
                                        paddingAll: 0,
                                        borderRadiusAll: 22,
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        child: Image.network(data.logo, height: 30, width: 30, fit: BoxFit.cover)),
                                  ),
                                  DataCell(TableRowContent(width: null, label: data.name, dark: dark)),
                                  DataCell(TableRowContent(width: 300, label: data.location, dark: dark)),
                                  DataCell(TableRowContent(width: null, label: data.date, dark: dark)),
                                ],
                              ),
                            )
                            .toList()),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
class DashboardPendingUserWidget extends StatelessWidget {
  const DashboardPendingUserWidget({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardProvider>(builder: (_, dashPro, __) {
      return MyCard(
        shadow: MyShadow(elevation: 0.5),
        paddingAll: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: MySpacing.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pending User',
                    style: Styles().text(
                      textType: MyTextType.titleMedium,
                      color: Colours().appBarOnBgColor(dark),
                      fontW: FontWeight.w600,
                      size: 15,
                    ),
                  ),
                  Text(
                    '16',
                    style: Styles().text(
                      textType: MyTextType.titleMedium,
                      color: Colours().appBarOnBgColor(dark),
                      fontW: FontWeight.w600,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            MySpacing.height(12),
            Center(
              child: Padding(
                padding: MySpacing.fromLTRB(16, 10, 16, 35),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: MyContainer.bordered(
                    paddingAll: 0,
                    child: DataTable(
                        sortAscending: true,
                        onSelectAll: (_) => {},
                        headingRowColor: MaterialStatePropertyAll(
                            Colours().appBarOnBgColor(!dark)),
                        dataRowHeight: 50,
                        columnSpacing: 35,
                        columns: [
                          DataColumn(label: TableRowHead(label: "logo", dark: dark)),
                          DataColumn(label: TableRowHead(label: "name", dark: dark)),
                          DataColumn(label: TableRowHead(label: "location", dark: dark)),
                          DataColumn(label: TableRowHead(label: "date", dark: dark)),
                        ],
                        rows: dashPro.dashboardProfiles
                            .mapIndexed(
                              (index, data) => DataRow(
                                cells: [
                                  DataCell(
                                    MyContainer(
                                        paddingAll: 0,
                                        borderRadiusAll: 22,
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        child: Image.network(data.logo, height: 30, width: 30, fit: BoxFit.cover)),
                                  ),
                                  DataCell(TableRowContent(width: null, label: data.name, dark: dark)),
                                  DataCell(TableRowContent(width: 300, label: data.location, dark: dark)),
                                  DataCell(TableRowContent(width: null, label: data.date, dark: dark)),
                                ],
                              ),
                            )
                            .toList()),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
class DashboardPendingCompanyWidget extends StatelessWidget {
  const DashboardPendingCompanyWidget({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardProvider>(builder: (_, dashPro, __) {
      return MyCard(
        shadow: MyShadow(elevation: 0.5),
        paddingAll: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: MySpacing.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pending Company',
                    style: Styles().text(
                      textType: MyTextType.titleMedium,
                      color: Colours().appBarOnBgColor(dark),
                      fontW: FontWeight.w600,
                      size: 15,
                    ),
                  ),
                  Text(
                    '56',
                    style: Styles().text(
                      textType: MyTextType.titleMedium,
                      color: Colours().appBarOnBgColor(dark),
                      fontW: FontWeight.w600,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            MySpacing.height(12),
            Center(
              child: Padding(
                padding: MySpacing.fromLTRB(16, 10, 16, 35),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: MyContainer.bordered(
                    paddingAll: 0,
                    child: DataTable(
                        sortAscending: true,
                        onSelectAll: (_) => {},
                        headingRowColor: MaterialStatePropertyAll(
                            Colours().appBarOnBgColor(!dark)),
                        dataRowHeight: 50,
                        columnSpacing: 35,
                        columns: [
                          DataColumn(label: TableRowHead(label: "logo", dark: dark)),
                          DataColumn(label: TableRowHead(label: "name", dark: dark)),
                          DataColumn(label: TableRowHead(label: "location", dark: dark)),
                          DataColumn(label: TableRowHead(label: "date", dark: dark)),
                        ],
                        rows: dashPro.dashboardProfiles
                            .mapIndexed(
                              (index, data) => DataRow(
                                cells: [
                                  DataCell(
                                    MyContainer(
                                        paddingAll: 0,
                                        borderRadiusAll: 22,
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        child: Image.network(data.logo, height: 30, width: 30, fit: BoxFit.cover)),
                                  ),
                                  DataCell(TableRowContent(width: null, label: data.name, dark: dark)),
                                  DataCell(TableRowContent(width: 300, label: data.location, dark: dark)),
                                  DataCell(TableRowContent(width: null, label: data.date, dark: dark)),
                                ],
                              ),
                            )
                            .toList()),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
class DashboardProfileCountersWidget extends StatelessWidget {
  const DashboardProfileCountersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeProvider>(builder: (_, themePro, __) {
      return MyFlex(
        runAlignment: WrapAlignment.start,
        wrapCrossAlignment: WrapCrossAlignment.start,
        contentPadding: false,
        children: [
          MyFlexItem(
            sizes: "md-6 lg-2",
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
            sizes: "md-6 lg-2",
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
            sizes: "md-6 lg-2",
            child: buildCard(
              Colours().success,
              Icons.people_sharp,
              "total user reg",
              "0",
              Icons.groups,
              Colours().grey4,
              "1.23",
              "Last Month",
              themePro.darkTheme,
            ),
          ),
          MyFlexItem(
            sizes: "md-6 lg-2",
            child: buildCard(
              Colours().warning,
              Icons.contact_mail_rounded,
              "total company reg",
              "0",
              Icons.groups,
              Colours().grey4,
              "0.2",
              "Last Day",
              themePro.darkTheme,
            ),
          ),
          MyFlexItem(
            sizes: "md-6 lg-2",
            child: buildCard(
              Colours().blue,
              Icons.pending_actions_outlined,
              "pending user profile",
              "384",
              Icons.groups,
              Colours().grey4,
              "0.2",
              "Last Day",
              themePro.darkTheme,
            ),
          ),
        ],
      );
    });
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
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
    height: 110,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
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
                      size: 12,
                    ),
                  ),
                  Text(
                    price,
                    style: Styles().text(
                      textType: MyTextType.bodyLarge,
                      color: Colours().appBarOnBgColor(dark),
                      fontW: FontWeight.w600,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
            MyContainer(
              height: 40,
              width: 40,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  trendingIcon,
                  color: trendingIconColor,
                  size: 12,
                ),
                MySpacing.width(8),
                Text(
                  "$percentage%",
                  style: Styles().text(
                    textType: MyTextType.bodyMedium,
                    color: Colours().appBarOnBgColor(dark),
                    size: 10,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  trendingIcon,
                  color: trendingIconColor,
                  size: 12,
                ),
                MySpacing.width(8),
                Text(
                  "$percentage%",
                  style: Styles().text(
                    textType: MyTextType.bodyMedium,
                    color: Colours().appBarOnBgColor(dark),
                    size: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/const/styles.dart';
import 'package:beonchat_admin/const/text_size.dart';
import 'package:beonchat_admin/model/reports/user_registration_all_model.dart';
import 'package:beonchat_admin/provider/reports/user_registration_report_provider.dart';
import 'package:beonchat_admin/widget/responsive/my_flex.dart';
import 'package:beonchat_admin/widget/responsive/my_flex_item.dart';
import 'package:beonchat_admin/widget/textfield/textfield.dart';
import 'package:beonchat_admin/widget/util/my_button.dart';
import 'package:beonchat_admin/widget/util/my_card.dart';
import 'package:beonchat_admin/widget/util/my_container.dart';
import 'package:beonchat_admin/widget/util/my_shadow.dart';
import 'package:beonchat_admin/widget/util/my_spacing.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class UserRegistrationReportChartWidget extends StatelessWidget {
  const UserRegistrationReportChartWidget({super.key, required this.dark, required this.type});

  final bool dark;
  final int type;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserRegistrationReportProvider>(builder: (_, userRgistrationPro, __) {
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
                'User Registration',
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
            UserRegistartionReportFilterWidget(dark: dark, type: type),
            MySpacing.height(60),
            UserRgistrationReportChartBarWidget(dark: dark),
            MySpacing.height(40),
          ],
        ),
      );
    });
  }
}

class UserRegistartionReportFilterWidget extends StatelessWidget {
  const UserRegistartionReportFilterWidget({super.key, required this.dark, required this.type});

  final bool dark;
  final int type;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserRegistrationReportProvider>(builder: (_, userRgistrationPro, __) {
      return Padding(
        padding: MySpacing.x(25),
        child: Center(
          child: MyFlex(
            runAlignment: WrapAlignment.start,
            wrapAlignment: WrapAlignment.start,
            wrapCrossAlignment: WrapCrossAlignment.end,
            contentPadding: false,
            spacing: 5,
            runSpacing: 10,
            children: [
              for (int num = 1; num <= 5; num++)
                MyFlexItem(
                    sizes: "md-4 lg-${num <= 4 ? 2 : 1}",
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "label here",
                          style: Styles().text(
                            textType: MyTextType.titleMedium,
                            color: Colours().blue,
                            fontW: FontWeight.w400,
                            size: 10,
                          ),
                        ),
                        MySpacing.height(5),
                        DropdownButtonFormField(
                            dropdownColor: Colours().white,
                            menuMaxHeight: 200,
                            isExpanded: true,
                            items: userRgistrationPro.listOption
                                .map((option) => DropdownMenuItem(
                                    value: option,
                                    child: Text(option["name"],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Styles().text(
                                          textType: MyTextType.bodySmall,
                                          color: Colours().appBarOnBgColor(dark),
                                          fontW: FontWeight.w400,
                                          size: 12,
                                        ))))
                                .toList(),
                            icon: const Icon(
                              LucideIcons.chevronDown,
                              size: 20,
                            ),
                            decoration: InputDecoration(
                                hintText: "select",
                                hintStyle: Styles().text(
                                  textType: MyTextType.labelMedium,
                                  color: Colours().appBarOnBgColor(dark),
                                  fontW: FontWeight.w400,
                                  size: 12,
                                ),
                                border: outlineInputBorder(dark),
                                enabledBorder: outlineInputBorder(dark),
                                focusedBorder: focusedInputBorder,
                                contentPadding: MySpacing.all(16),
                                isCollapsed: true,
                                floatingLabelBehavior: FloatingLabelBehavior.never),
                            onChanged: userRgistrationPro.onChangeLabelType),
                      ],
                    )),
              MyFlexItem(
                sizes: "md-4 lg-1",
                child: MyButton(
                  onPressed: () {},
                  elevation: 0,
                  padding: MySpacing.xy(20, 16),
                  backgroundColor: Colours().blue,
                  borderRadiusAll: 6,
                  child: Text("filter",
                      style: Styles().text(
                        textType: MyTextType.bodySmall,
                        color: Colours().white,
                        fontW: FontWeight.w400,
                        size: 13,
                      )),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class UserRgistrationReportChartBarWidget extends StatelessWidget {
  const UserRgistrationReportChartBarWidget({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserRegistrationReportProvider>(builder: (_, userRgistrationPro, __) {
      return Padding(
        padding: MySpacing.x(20),
        child: SfCartesianChart(
          //title: ChartTitle(text: 'Campaign Report'),
          plotAreaBorderWidth: 0,
          legend: Legend(isVisible: true, position: LegendPosition.bottom),

          /// X axis as numeric axis placed here.
          primaryXAxis: NumericAxis(
              //title: AxisTitle(text: 'Match'),
              minimum: 0,
              maximum: 31,
              interval: 1,
              majorGridLines: const MajorGridLines(width: 0),
              majorTickLines: const MajorTickLines(size: 0),
              edgeLabelPlacement: EdgeLabelPlacement.hide),
          primaryYAxis: NumericAxis(
            //title: AxisTitle(text: 'Score'),
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(size: 0),
          ),
          series: getDefaultNumericSeries(userRgistrationPro.userRegistrationReportModel),
          tooltipBehavior: TooltipBehavior(enable: true, format: 'Score: point.y', canShowMarker: false),
        ),
      );
    });
  }

  List<ColumnSeries<UserRegistrationReportModel, num>> getDefaultNumericSeries(List<UserRegistrationReportModel> listData) {
    return <ColumnSeries<UserRegistrationReportModel, num>>[
      // USER
      ColumnSeries<UserRegistrationReportModel, num>(
          name: 'user',
          dataSource: listData,
          color: const Color.fromRGBO(207, 31, 25, 1),
          xValueMapper: (UserRegistrationReportModel profile, _) => profile.xId as num,
          yValueMapper: (UserRegistrationReportModel profile, _) => profile.user),

      // TEAM
      ColumnSeries<UserRegistrationReportModel, num>(
        name: 'team',
        dataSource: listData,
        color: const Color.fromRGBO(4, 181, 1, 1),
        xValueMapper: (UserRegistrationReportModel profile, _) => profile.xId as num,
        yValueMapper: (UserRegistrationReportModel profile, _) => profile.team,
      ),

      // COMPANY
      ColumnSeries<UserRegistrationReportModel, num>(
        name: 'company',
        dataSource: listData,
        color: const Color.fromRGBO(143, 134, 134, 1),
        xValueMapper: (UserRegistrationReportModel profile, _) => profile.xId as num,
        yValueMapper: (UserRegistrationReportModel profile, _) => profile.company,
      ),
    ];
  }
}

import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/const/styles.dart';
import 'package:beonchat_admin/const/text_size.dart';
import 'package:beonchat_admin/model/navigation_bar/navigation_bar_model.dart';
import 'package:beonchat_admin/provider/main/main_provider.dart';
import 'package:beonchat_admin/widget/util/my_container.dart';
import 'package:beonchat_admin/widget/util/my_spacing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiNavItem extends StatelessWidget {
  final NavBarItem data;
  final bool dark, hide;
  final int i, j, k;

  const MultiNavItem(
      {Key? key,
      required this.data,
      required this.dark,
      required this.hide,
      required this.i,
      required this.j,
      required this.k})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (_, mainPro, __) {
      return GestureDetector(
        onTap: () {
          mainPro.updateNavigation(mainIndex: i,itemIndex: j,subItemIndex: k,context: context);
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onHover: (event) {
            mainPro.updateExpandedHover(i, j, k, true);
          },
          onExit: (event) {
            mainPro.updateExpandedHover(i, j, k, false);
          },
          child: MyContainer.transparent(
            margin: MySpacing.fromLTRB(4, 0, 8, 4),
            color: data.active || data.hover
                ? Colours().activeCardColor(dark)
                : Colours().trans,
            width: MediaQuery.of(context).size.width,
            padding: MySpacing.xy(18, 7),
            child: Text(
              "${hide ? "" : "-  "}${data.title}",
              style: Styles().text(
                fontW: data.active || data.hover
                    ? FontWeight.w600
                    : FontWeight.w500,
                color: data.active || data.hover
                    ? Colours().activeItemColor(dark)
                    : Colours().appBarOnBgColor(dark),
                size: 12.5,
                textType: MyTextType.bodySmall,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      );
    });
  }
}

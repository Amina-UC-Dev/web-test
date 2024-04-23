import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/const/styles.dart';
import 'package:beonchat_admin/const/text_size.dart';
import 'package:beonchat_admin/model/navigation_bar/navigation_bar_model.dart';
import 'package:beonchat_admin/widget/util/my_container.dart';
import 'package:beonchat_admin/widget/util/my_spacing.dart';
import 'package:flutter/material.dart';

class NavTile extends StatelessWidget {
  const NavTile(
      {super.key,
      required this.hide,
      required this.dark,
      required this.data});

  final bool hide, dark;
  final NavBarItem data;

  @override
  Widget build(BuildContext context) {
    return MyContainer.transparent(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      color: (data.active || data.hover) && !data.multi
          ? Colours().activeCardColor(dark)
          : Colours().trans,
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment:
            hide ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          Icon(
            data.icon,
            size: 20,
            color: data.active || data.hover
                ? Colours().activeItemColor(dark)
                : Colours().appBarOnBgColor(dark),
          ),
          if (!hide) MySpacing.width(16),
          if (!hide)
            Expanded(
              child: Text(
                data.title,
                style: Styles().text(
                    textType: MyTextType.labelLarge,
                    fontW: FontWeight.w400,
                    color: data.active || data.hover
                        ? Colours().activeItemColor(dark)
                        : Colours().appBarOnBgColor(dark),
                    space: 0),
              ),
            ),
          if (data.multi && !hide)
            Image.asset(
              "assets/image/forward-arrow.png",
              height: 15,
              color: Colours().grey,
            ),
        ],
      ),
    );
  }
}

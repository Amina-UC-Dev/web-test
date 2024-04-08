import 'package:beonchat_admin/const/colors.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({Key? key, this.hPadding, this.color, this.vPadding})
      : super(key: key);

  final double? hPadding, vPadding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: hPadding ?? 0,
        vertical: vPadding ?? 0,
      ),
      child: Divider(
        color: color ?? Colours().grey2,
        thickness: .5,
        height: .5,
      ),
    );
  }
}

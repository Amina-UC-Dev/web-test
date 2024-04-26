import 'package:beonchat_admin/widget/util/my_spacing.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({Key? key, this.hPadding, this.color, this.vPadding})
      : super(key: key);

  final double? hPadding, vPadding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MySpacing.xy(
        hPadding ?? 0,
        vPadding ?? 0,
      ),
      child: const Divider(),
    );
  }
}

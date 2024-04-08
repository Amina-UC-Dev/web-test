import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/const/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TextFieldWidget {
  hintTextField({
    required TextEditingController controller,
    required int type,
    required TextInputType inputType,
    required String hintText,
    required bool obscure,
    required String? Function(String?) validator,
    required Function(String val) onChange,
    required Function(String val) onSubmit,
    required Color textColor,
    bool? specialChar,
    FocusNode? focusNode,
    double? textSize,
    double? hintSize,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return SizedBox(height: (type == 1 ? 50 :60).sp,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        inputFormatters: inputFormatters ??
            (specialChar == true
                ? []
                : [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\s]')),
                  ]),
        onChanged: onChange,
        keyboardType: inputType,
        onFieldSubmitted: onSubmit,
        validator: validator,
        obscureText: obscure,
        style: Styles().normalS(
            fontW: FontWeight.w400,
            color: textColor,
            size: textSize ?? (type == 1 ? 16 : 17)),
        decoration: InputDecoration(
          errorStyle: const TextStyle(height: 0),
          hintText: hintText.tr,
          hintStyle: Styles().normalS(
              fontW: FontWeight.w400,
              color: Colours().grey,
              size: hintSize ?? (type == 1 ? 16 : 17)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: Colours().grey3, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: Colours().primary, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(width: 1, color: Colours().primary)),
          contentPadding: EdgeInsets.symmetric(horizontal: 15.sp)
        ),
      ),
    );
  }
}
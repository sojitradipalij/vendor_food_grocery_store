import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_utils.dart';

class CommonTextfield extends StatelessWidget {
  CommonTextfield({
    Key? key,
    this.labelText,
    required this.controller,
    required this.hintText,
    this.textInput = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.textAlign = TextAlign.left,
    this.isSecure = false,
    this.isDisabled = false,
    this.isDigitsOnly = false,
    this.maxLength,
    this.suffixWidget,
    this.prefixWidget,
    this.focus,
    this.validation,
    this.emptyValidation = true,
    this.nextFocus,
    this.onChange,
    this.maxLine,
    this.contentPadding,
    this.fillColor,
    this.radius,
  }) : super(key: key);

  String? labelText;
  final TextEditingController controller;
  final TextInputType textInput;
  final TextInputAction textInputAction;
  final TextAlign textAlign;
  final String hintText;
  int? maxLength;
  bool isSecure;
  bool isDisabled = false;
  bool isDigitsOnly;
  bool emptyValidation;
  FocusNode? focus;
  Widget? suffixWidget;
  Widget? prefixWidget;
  var validation;
  var nextFocus;
  var onChange;
  int? maxLine;
  Color? fillColor;
  EdgeInsetsGeometry? contentPadding;
  double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller,
            keyboardType: textInput,
            textInputAction: textInputAction,
            inputFormatters: isDigitsOnly
                ? [
                    FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      try {
                        final text = newValue.text;
                        if (text.isNotEmpty) double.parse(text);
                        return newValue;
                      } catch (e) {}
                      return oldValue;
                    }),
                  ]
                : null,
            maxLength: maxLength,
            maxLines: maxLine,
            focusNode: focus,
            obscureText: isSecure,
            cursorColor: Colors.black,
            // enabled: isDisabled,
            textCapitalization: textInput!=TextInputType.emailAddress?TextCapitalization.sentences:TextCapitalization.none,
            textAlignVertical: TextAlignVertical.bottom,
            textAlign: textAlign,
            style: blackRegular16,
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                ),
                child: suffixWidget,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 2),
                child: prefixWidget,
              ),
              prefixIconConstraints: const BoxConstraints(maxHeight: 24),
              filled: true,
              fillColor: fillColor ?? Colors.white,
              suffixIconConstraints: const BoxConstraints(maxHeight: 24),
              counterText: "",
              hintText: hintText,
              hintStyle: hintTextStyle,
              contentPadding: contentPadding ??
                  const EdgeInsets.only(bottom: 15, top: 15, left: 15),
              isDense: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius??3.r),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius??3.r),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius??3.r),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius??3.r),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
            ),
            validator: emptyValidation
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return '$hintText Required';
                    }
                    return null;
                  }
                : validation,
            onEditingComplete: nextFocus,
            onChanged: onChange,
          ),
        ],
      ),
    );
  }
}

class CommonTextwWithoutField extends StatelessWidget {
  CommonTextwWithoutField({
    Key? key,
    this.labelText,
    required this.controller,
    required this.hintText,
    this.textInput = TextInputType.text,
    this.textAlign = TextAlign.left,
    this.isSecure = false,
    this.isDisabled = false,
    this.isDigitsOnly = false,
    this.maxLength,
    this.suffixWidget,
    this.prefixWidget,
    this.focus,
    this.validation,
    this.emptyValidation = false,
    this.nextFocus,
    this.onChange,
    this.maxLine,
    this.contentPadding,
    this.fillColor,
  }) : super(key: key);

  String? labelText;
  final TextEditingController controller;
  final TextInputType textInput;
  final TextAlign textAlign;
  final String hintText;
  int? maxLength;
  bool isSecure;
  bool isDisabled = false;
  bool isDigitsOnly;
  bool emptyValidation;
  FocusNode? focus;
  Widget? suffixWidget;
  Widget? prefixWidget;
  var validation;
  var nextFocus;
  var onChange;
  int? maxLine;
  Color? fillColor;
  EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(hintText,style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500),),
          TextFormField(
            controller: controller,
            keyboardType: textInput,
            textInputAction: TextInputAction.next,
            inputFormatters: isDigitsOnly
                ? [
                    FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      try {
                        final text = newValue.text;
                        if (text.isNotEmpty) double.parse(text);
                        return newValue;
                      } catch (e) {}
                      return oldValue;
                    }),
                  ]
                : null,
            maxLength: maxLength,
            maxLines: maxLine,
            focusNode: focus,
            obscureText: isSecure,
            cursorColor: Colors.black,
            // enabled: isDisabled,
            textCapitalization: textInput!=TextInputType.emailAddress?TextCapitalization.sentences:TextCapitalization.none,
            textAlignVertical: TextAlignVertical.bottom,
            textAlign: textAlign,
            style: TextStyle(fontSize: 16.sp),
            decoration: InputDecoration(
              suffixIcon: suffixWidget!=null?Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                ),
                child: suffixWidget,
              ):null,
              prefixIcon: prefixWidget!=null?Padding(
                padding: const EdgeInsets.only(left: 0, right: 10, bottom: 2),
                child: prefixWidget,
              ):null,
              prefixIconConstraints: const BoxConstraints(maxHeight: 24),
              filled: false,
              fillColor: fillColor ?? Colors.grey.withOpacity(0.2),
              suffixIconConstraints: const BoxConstraints(maxHeight: 24),
              counterText: "",
              hintText: hintText,
              hintStyle: hintTextStyle,
              contentPadding: contentPadding ??
                  const EdgeInsets.only(bottom: 15, top: 15, left: 0),
              isDense: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
            ),
            validator: emptyValidation
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return '$hintText Required';
                    }
                    return null;
                  }
                : validation,
            onEditingComplete: nextFocus,
            onChanged: onChange,
          ),
        ],
      ),
    );
  }
}

class CommonTextWithUnderLine extends StatelessWidget {
  CommonTextWithUnderLine({
    Key? key,
    this.labelText,
    required this.controller,
    required this.hintText,
    this.textInput = TextInputType.text,
    this.textAlign = TextAlign.left,
    this.isSecure = false,
    this.isDisabled = false,
    this.isDigitsOnly = false,
    this.maxLength,
    this.suffixWidget,
    this.prefixWidget,
    this.focus,
    this.validation,
    this.emptyValidation = true,
    this.nextFocus,
    this.onChange,
    this.maxLine,
    this.contentPadding,
    this.fillColor,
  }) : super(key: key);

  String? labelText;
  final TextEditingController controller;
  final TextInputType textInput;
  final TextAlign textAlign;
  final String hintText;
  int? maxLength;
  bool isSecure;
  bool isDisabled = false;
  bool isDigitsOnly;
  bool emptyValidation;
  FocusNode? focus;
  Widget? suffixWidget;
  Widget? prefixWidget;
  var validation;
  var nextFocus;
  var onChange;
  int? maxLine;
  Color? fillColor;
  EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller,
            keyboardType: textInput,
            enabled: !isDisabled,
            textInputAction: TextInputAction.next,
            inputFormatters: isDigitsOnly
                ? [
                    FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      try {
                        final text = newValue.text;
                        if (text.isNotEmpty) double.parse(text);
                        return newValue;
                      } catch (e) {}
                      return oldValue;
                    }),
                  ]
                : null,
            maxLength: maxLength,
            maxLines: maxLine,
            focusNode: focus,
            obscureText: isSecure,
            cursorColor: Colors.white,
            // enabled: isDisabled,
            textAlignVertical: TextAlignVertical.bottom,
            textAlign: textAlign,
            style: whiteRegular16,
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                ),
                child: suffixWidget,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 0, right: 10, bottom: 2),
                child: prefixWidget,
              ),
              prefixIconConstraints: const BoxConstraints(maxHeight: 24),
              filled: false,
              fillColor: fillColor ?? Colors.grey.withOpacity(0.2),
              suffixIconConstraints: const BoxConstraints(maxHeight: 24),
              counterText: "",
              labelText: hintText,
              labelStyle: hintTextStyle.copyWith(fontSize: 16.sp),
              hintStyle: hintTextStyle,
              contentPadding: contentPadding ??
                  const EdgeInsets.only(bottom: 5, top: 5, left: 0),
              // isDense: true,
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF5A5A67)),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF5A5A67)),
              ),
              disabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF5A5A67)),
              ),
              border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF5A5A67)),
              ),
            ),
            validator: emptyValidation
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return '$hintText Required';
                    }
                    return null;
                  }
                : validation,
            onEditingComplete: nextFocus,
            onChanged: onChange,
          ),
        ],
      ),
    );
  }
}

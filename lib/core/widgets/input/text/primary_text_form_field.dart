import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leyli_travel_mozz/app/dimension/design_dimension.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';

class PrimaryTextFormField extends StatelessWidget {
  const PrimaryTextFormField({
    Key? key,
    this.hintText = '',
    this.borderRadius,
    this.textInputAction,
    this.textCapitalization,
    this.maxLines = 1,
    this.suffixIcon,
    this.suffix,
    this.suffixText,
    this.focusNode,
    this.floatingLabelBehavior,
    this.onTapOutside,
    this.controller,
    this.onTap,
    this.minLines,
    this.validator,
    this.readOnly = false,
    this.textInputType,
    this.isRequired = true,
    this.textFormFieldHeight,
    this.contentPadding,
    this.prefixIcon,
    this.suffixIconColor,
    this.onChanged,
    this.isFilled = true,
    this.initialText,
    this.labelText,
    this.textAlign=TextAlign.start,
    this.onEditingComplete,
    this.paddingTextFormFiled = EdgeInsets.zero,
    this.inputFormatters,
  }) : super(key: key);

  final String hintText;
  final String? suffixText;
  final TextCapitalization? textCapitalization;
  final double? borderRadius;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Function(PointerDownEvent)? onTapOutside;
  final TextInputType? textInputType;
  final int? maxLines;
  final int? minLines;
  final Color? suffixIconColor;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Widget? prefixIcon;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextEditingController? controller;
  final Function()? onTap;
  final Function(String?)? onChanged;
  final Function()? onEditingComplete;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final bool isRequired;
  final TextAlign textAlign;
  final double? textFormFieldHeight;
  final EdgeInsets? contentPadding;
  final bool isFilled;
  final String? initialText;
  final String? labelText;
  final EdgeInsets paddingTextFormFiled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines,
      validator: validator,
      textCapitalization: textCapitalization ?? TextCapitalization.sentences,
      inputFormatters: inputFormatters,
      focusNode: focusNode,
      onTapOutside: onTapOutside ??
          (event) {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
      textInputAction: textInputAction,
      maxLines: maxLines,
      readOnly: readOnly,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      onTap: onTap,
      keyboardType: textInputType,
      controller: controller,
      textAlign: textAlign,
      decoration: InputDecoration(
        
        floatingLabelBehavior: floatingLabelBehavior,
        suffixText: suffixText,
        suffixIconColor: suffixIconColor,
        hintText: hintText,
        filled: isFilled,
        labelText: labelText,
        fillColor: isFilled ? context.colors.white : Colors.transparent,
        suffixIcon: suffixIcon,
        suffix: suffix,
        prefixIcon: prefixIcon,
        contentPadding: contentPadding,
        border: borderRadius == null
            ? Theme.of(context).inputDecorationTheme.border
            : OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.colors.grey,
                  width: DDimens.thickness,
                ),
                borderRadius: BorderRadius.circular(borderRadius!),
              ),
        disabledBorder: borderRadius == null
            ? Theme.of(context).inputDecorationTheme.disabledBorder
            : OutlineInputBorder(
                borderSide: BorderSide(
                    color: context.colors.grey, width: DDimens.thickness),
                borderRadius: BorderRadius.circular(borderRadius!),
              ),
        enabledBorder: borderRadius == null
            ? Theme.of(context).inputDecorationTheme.enabledBorder
            : OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.colors.grey,
                  width: DDimens.thickness,
                ),
                borderRadius: BorderRadius.circular(borderRadius!),
              ),
        focusedBorder: borderRadius == null
            ? Theme.of(context).inputDecorationTheme.focusedBorder
            : OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.colors.primaryGreen,
                ),
                borderRadius: BorderRadius.circular(borderRadius!),
              ),
      ),
    );
  }
}

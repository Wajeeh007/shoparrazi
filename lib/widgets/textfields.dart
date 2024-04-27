import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoparrazi/helpers/constants.dart';

class TextFieldWithTitle extends StatelessWidget {
  final String? title;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int maxLines;
  final int? minLines;
  final GestureTapCallback? onTap;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final AutovalidateMode? autoValidateMode;
  final bool asterisk;
  final bool? showCursor;
  final bool readOnly;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final Color fillColor;
  final bool filled;
  final String? initialValue;
  final bool isDropDown;
  final IconData? suffixIcon;
  final Widget? suffixIconButton;
  final IconData? prefixIcon;
  final EdgeInsetsGeometry contentPadding;
  final TextStyle? textStyle;
  final List<TextInputFormatter>? inputFormatters;

  ///USAGE INFORMATION:
  ///
  /// (Note) : Only one of these can be used at a time...
  ///
  ///1 - suffixIconButton :- (widget) used for Clickable suffixIcon
  ///
  ///2- suffixIcon :- (IconData) used for static Icon
  ///
  ///3- ( isDropDown:true,  onTap:(){} ) :- To make text-field look like a dropDown use these
  ///
  ///
  const TextFieldWithTitle({
    super.key,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 10,
    ),
    this.asterisk = false,
    this.validator,
    this.onChanged,
    this.obscureText = false,
    this.autoValidateMode,
    this.title,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.maxLines = 1,
    this.onTap,
    this.minLines,
    this.showCursor,
    this.suffixIcon,
    this.fillColor = Colors.white,
    this.errorText,
    this.readOnly = false,
    this.textStyle,
    this.filled = true,
    this.isDropDown = false,
    this.prefixIcon,
    this.suffixIconButton,
    this.initialValue,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (title == null)
            ? const SizedBox()
            : Padding(
          padding: const EdgeInsets.only(bottom: 8.5),
          child: RichText(
            text: TextSpan(
              text: title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontSize: 20
              ),
              children: [
                (asterisk)
                    ? const TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                )
                    : const TextSpan(text: '')
              ],
            ),
          ),
        ),
        TextFormField(
          inputFormatters: inputFormatters,
          controller: controller,
          initialValue: initialValue,
          keyboardType: keyboardType,
          minLines: minLines,
          maxLines: maxLines,
          onChanged: onChanged,
          showCursor: readOnly ? false : showCursor,
          readOnly: isDropDown ? true : readOnly,
          autovalidateMode: autoValidateMode,
          obscureText: obscureText,
          validator: validator,
          onTap: onTap,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
          decoration: InputDecoration(
            errorText: errorText,
            suffixIcon: (suffixIcon != null || isDropDown)
                ? Icon(
              suffixIcon ?? Icons.keyboard_arrow_down_rounded,
              size: 20,
              color: primaryTextGrey,
            )
                : suffixIconButton,
            suffixIconConstraints: BoxConstraints.tight(const Size(40, 30)),
            prefixIcon: prefixIcon != null
                ? Icon(
              prefixIcon,
              size: 20,
              color: primaryTextGrey,
            ) : null,
            prefixIconConstraints: BoxConstraints.tight(const Size(40, 40)),
            contentPadding: contentPadding,
            fillColor: textFieldFillGrey,
            filled: filled,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
            isDense: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(width: 1, color: textFieldFillGrey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
              const BorderSide(width: 1, color: textFieldFillGrey),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(width: 1, color: Colors.red.shade700),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(width: 1, color: Colors.red.shade700),
            ),
          ),
        ),
      ],
    );
  }
}

class TextFieldWithoutTitle extends StatelessWidget {
  final String? title;
  final String? hintText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String? label;
  final EdgeInsetsGeometry? contentPadding;
  final bool obscureText;
  final TextStyle? titleTextStyle;
  final TextEditingController? controller;
  final Color? fillColor;
  final Color? titleColor;
  final FocusNode? focusNode;
  final bool readOnly;
  final bool enabled;
  final bool? showCursor;
  final String? initialValue;
  final AutovalidateMode? autoValidateMode;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  const TextFieldWithoutTitle({
    super.key,
    this.showCursor,
    this.readOnly = false,
    this.fillColor,
    this.onChanged,
    this.focusNode,
    this.titleColor,
    this.onTap,
    this.initialValue,
    this.enabled = true,
    this.contentPadding = const EdgeInsets.all(8),
    this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.hintText,
    this.prefixIcon,
    this.label,
    this.title,
    this.autoValidateMode,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
    this.titleTextStyle
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onTap: onTap,
      focusNode: focusNode,
      enabled: enabled,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      validator: validator,
      autovalidateMode: autoValidateMode,
      showCursor: showCursor,
      readOnly: readOnly,
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: primaryTextGrey,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
          prefixIcon,
          color: primaryTextGrey,
          size: 30,
        ) : null,
        prefixIconConstraints: BoxConstraints.tight(const Size(70, 40)),
        contentPadding: contentPadding,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        errorStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: Colors.red,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryGreen, width: 1.2),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          const BorderSide(color: primaryGreen, width: 1.5),
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

class RoundedRectTextField extends StatelessWidget {
  final String? title;
  final String? hintText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String? label;
  final EdgeInsetsGeometry? contentPadding;
  final bool obscureText;
  final TextStyle? titleTextStyle;
  final TextEditingController? controller;
  final Color fillColor;
  final Color? titleColor;
  final FocusNode? focusNode;
  final bool readOnly;
  final bool enabled;
  final bool? showCursor;
  final String? initialValue;
  final AutovalidateMode? autoValidateMode;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final Color borderColor;

  const RoundedRectTextField({
    super.key,
    this.showCursor,
    this.readOnly = false,
    this.fillColor = Colors.white,
    this.onChanged,
    this.focusNode,
    this.titleColor,
    this.onTap,
    this.initialValue,
    this.enabled = true,
    this.contentPadding = const EdgeInsets.all(8),
    this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.hintText,
    this.prefixIcon,
    this.label,
    this.title,
    this.autoValidateMode,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
    this.titleTextStyle,
    this.borderColor = Colors.white
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onTap: onTap,
      focusNode: focusNode,
      enabled: enabled,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      validator: validator,
      autovalidateMode: autoValidateMode,
      showCursor: showCursor,
      readOnly: readOnly,
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: primaryTextGrey,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
          prefixIcon,
          color: primaryTextGrey,
          size: 20,
        ) : null,
        prefixIconConstraints: BoxConstraints.tight(const Size(40, 40)),
        contentPadding: contentPadding,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        errorStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: Colors.red,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 1.2),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: borderColor, width: 1.5),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
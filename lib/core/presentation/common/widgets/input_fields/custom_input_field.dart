import 'package:flutter/material.dart';
import 'package:warranty_saver/core/presentation/common/styles/custom_text_styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.autofocus = false,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.disabledBorderColor,
    this.hintStyle,
    this.textStyle,
    this.labelStyle,
    this.fillColor,
    this.filled = false,
    this.width = double.infinity,
    this.height = 50,
    this.textColor,
    this.cursorColor,
    this.textInputAction = TextInputAction.done,
    this.textInputType = TextInputType.text,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final bool autofocus;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final EdgeInsetsGeometry contentPadding;
  final BorderRadius borderRadius;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? disabledBorderColor;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final Color? fillColor;
  final bool filled;
  final double width;
  final double height;
  final Color? textColor;
  final Color? cursorColor;
  final TextInputAction textInputAction;
  final TextInputType textInputType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> with TickerProviderStateMixin {
  final _node = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _fieldKey = GlobalKey<FormFieldState<String>>();
  bool _showError = false;

  @override
  void initState() {
    super.initState();
    _node.addListener(() {
      if (!_node.hasFocus) {
        _formKey.currentState?.validate();
        _showError = _fieldKey.currentState?.errorText != null;
      } else {
        _showError = false;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final inputTextColor = widget.textColor ?? Colors.black;
    final cursorCol = widget.cursorColor ?? inputTextColor;

    final enabledBorder = OutlineInputBorder(
      borderRadius: widget.borderRadius,
      borderSide: BorderSide(color: widget.enabledBorderColor ?? theme.dividerColor, width: 2),
    );
    final focusedBorder = OutlineInputBorder(
      borderRadius: widget.borderRadius,
      borderSide: BorderSide(color: widget.focusedBorderColor ?? cursorCol, width: 2),
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: widget.borderRadius,
      borderSide: BorderSide(color: widget.errorBorderColor ?? theme.colorScheme.error, width: 2),
    );
    final disabledBorder = OutlineInputBorder(
      borderRadius: widget.borderRadius,
      borderSide: BorderSide(color: widget.disabledBorderColor ?? theme.disabledColor, width: 2),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Text(
            widget.labelText!,
            style: widget.labelStyle ?? CustomTextStyles.of(context).medium14.apply(color: Colors.black),
          ),
        SizedBox(
          width: widget.width,
          height: widget.height,
          child: Form(
            key: _formKey,
            child: TextFormField(
              key: _fieldKey,
              controller: widget.controller,
              initialValue: widget.controller == null ? widget.initialValue : null,
              keyboardType: widget.textInputType,
              textInputAction: widget.textInputAction,
              autofocus: widget.autofocus,
              enabled: widget.enabled,
              obscureText: widget.obscureText,
              style: widget.textStyle ?? TextStyle(color: inputTextColor),
              cursorColor: cursorCol,
              autovalidateMode: AutovalidateMode.disabled,
              onChanged: (v) {
                widget.onChanged?.call(v);
                _fieldKey.currentState?.validate();
                if (_node.hasFocus) {
                  if ((_fieldKey.currentState?.errorText) == null) {
                    _showError = false;
                  }
                } else {
                  _showError = _fieldKey.currentState?.errorText != null;
                }
                setState(() {});
              },
              validator: widget.validator,
              focusNode: _node,
              onSaved: widget.onSaved,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: widget.hintStyle ?? theme.inputDecorationTheme.hintStyle?.copyWith(color: inputTextColor),
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
                contentPadding: widget.contentPadding,
                enabledBorder: enabledBorder,
                focusedBorder: focusedBorder,
                errorBorder: errorBorder,
                disabledBorder: disabledBorder,
                border: enabledBorder,
                filled: widget.filled,
                fillColor: widget.fillColor,
                errorStyle: const TextStyle(fontSize: 0, height: 0),
                errorMaxLines: 1,
              ),
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          alignment: Alignment.topLeft,
          child: Builder(
            builder: (_) {
              final error = _fieldKey.currentState?.errorText;
              if (!_showError || error == null) return const SizedBox.shrink();
              return Text(
                error,
                style: CustomTextStyles.of(context).medium12.apply(color: theme.colorScheme.error),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              );
            },
          ),
        ),
      ],
    );
  }
}

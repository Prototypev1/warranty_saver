import 'package:flutter/material.dart';
import 'package:warranty_saver/core/presentation/common/widgets/loading_indicators/custom_loading_indicator.dart';

class CustomRegisterButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double? borderRadius;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final bool isLoading;
  final Widget? loadingWidget;

  const CustomRegisterButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
    this.borderRadius,
    this.height,
    this.width,
    this.padding,
    this.textStyle,
    required this.isLoading,
    this.loadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? MediaQuery.of(context).size.width,
      child: Material(
        color: (onPressed == null || isLoading) ? Colors.grey.shade700 : backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        child: InkWell(
          onTap: (isLoading || onPressed == null) ? null : onPressed,
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          splashColor: Colors.white.withValues(alpha: .3),
          highlightColor: Colors.white.withValues(alpha: .1),
          child: Container(
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
            child: Center(
              child: isLoading
                  ? loadingWidget ??
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: CustomLoadingIndicator(textColor: textColor),
                        )
                  : Text(
                      text,
                      style:
                          textStyle ??
                          TextStyle(
                            color: textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

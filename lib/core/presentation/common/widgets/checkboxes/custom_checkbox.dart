import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool? isChecked;
  const CustomCheckbox({super.key, this.isChecked = false});

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.white,
      fillColor: WidgetStatePropertyAll(Colors.black),
      value: widget.isChecked,
      onChanged: (isChecked) {
        isChecked != widget.isChecked;
      },
    );
  }
}

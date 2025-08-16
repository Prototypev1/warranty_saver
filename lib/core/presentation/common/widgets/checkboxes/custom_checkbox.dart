import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (v) => onChanged(v ?? false),
      checkColor: Colors.white,
      side: const BorderSide(color: Colors.black, width: 1.5),
      fillColor: WidgetStateProperty.resolveWith((states) {
        return states.contains(WidgetState.selected) ? Colors.black : Colors.white;
      }),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}

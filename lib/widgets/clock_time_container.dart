import 'package:flutter/material.dart';

class ClockTimeContainer extends StatelessWidget {
  final Offset pos;
  final double size;
  final bool isSelected;
  final String value;
  final double fontSize;
  const ClockTimeContainer({
    super.key,
    required this.size,
    required this.isSelected,
    required this.pos,
    required this.value,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: pos,
      child: Container(
        width: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.lightBlue[500] : Colors.transparent,
        ),
        child: Text(
          value,
          style: TextStyle(
            color: !isSelected ? Colors.grey[400] : Colors.black,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

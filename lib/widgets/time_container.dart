import 'package:flutter/material.dart';

class TimeContainer extends StatelessWidget {
  final int hour;
  final int minutes;
  const TimeContainer({
    super.key,
    required this.hour,
    required this.minutes,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: const Color(0xff0a4c5c),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xff85bcca),
            ),
          ),
          child: Text(
            hour.toString(),
            style: const TextStyle(
              color: Color(0xff85bcca),
              fontSize: 50,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            ':',
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xff454d50),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            minutes.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 50,
            ),
          ),
        ),
      ],
    );
  }
}

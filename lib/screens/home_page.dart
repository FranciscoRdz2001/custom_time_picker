import 'dart:math';

import 'package:flutter/material.dart';
import 'package:widget_around/widgets/clock_time_container.dart';
import 'package:widget_around/widgets/line_paint.dart';
import 'package:widget_around/widgets/time_container.dart';

class HomePage extends StatelessWidget {
  static const double _widgetRadius = 300;
  static const double hoursRadius = (_widgetRadius * 0.8) / 2;
  static const double minutesRadius = (_widgetRadius * 0.5) / 2;
  const HomePage({super.key});

  Offset _getOffset(final double slice, final int index, final double radio) {
    final angle = slice * index;
    final x = radio * cos(angle);
    final y = radio * sin(angle);
    return Offset(x, y);
  }

  @override
  Widget build(BuildContext context) {
    final List<int> hours = List.generate(12, (index) => index);
    final List<int> minutes = List.generate(12, (index) => 12 + index);

    final double hoursSlice = 2 * pi / hours.length;
    final double minutesSlice = 2 * pi / minutes.length;

    final int hourSelected = hours[Random().nextInt(hours.length - 1)];
    final int minuteSelected = minutes[Random().nextInt(minutes.length - 1)];
    final Offset hourSelectedPos =
        _getOffset(hoursSlice, hourSelected, hoursRadius);
    final Offset minuteSelectedPos =
        _getOffset(minutesSlice, minuteSelected, minutesRadius);

    return Scaffold(
      backgroundColor: const Color(0xff2b373b),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Seleccionar la hora: ',
                style: TextStyle(
                  color: Color(0xff869195),
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 40),
              TimeContainer(hour: hourSelected, minutes: minuteSelected),
              const SizedBox(height: 40),
              Container(
                height: _widgetRadius,
                width: _widgetRadius,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff454d50),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: _widgetRadius * 0.04,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.lightBlue[500],
                      ),
                    ),
                    CustomPaint(
                      size: const Size(0, 0),
                      painter: LinePaint(linePos: hourSelectedPos),
                    ),
                    ...List.generate(hours.length, (index) {
                      final isSelected = hourSelected == index;
                      final pos = _getOffset(hoursSlice, index, hoursRadius);

                      return ClockTimeContainer(
                        size: _widgetRadius * 0.16,
                        isSelected: isSelected,
                        pos: pos,
                        value: hours[index].toString(),
                        fontSize: 18,
                      );
                    }),
                    CustomPaint(
                      size: const Size(0, 0),
                      painter: LinePaint(linePos: minuteSelectedPos),
                    ),
                    ...List.generate(minutes.length, (index) {
                      final Offset pos =
                          _getOffset(minutesSlice, index, minutesRadius);
                      final isSelected = minuteSelected == minutes[index];
                      return ClockTimeContainer(
                        size: _widgetRadius * 0.1,
                        isSelected: isSelected,
                        pos: pos,
                        value: minutes[index].toString(),
                        fontSize: 16,
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

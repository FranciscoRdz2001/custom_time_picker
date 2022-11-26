import 'dart:math';

import 'package:flutter/material.dart';
import 'package:widget_around/widgets/line_paint.dart';

class HomePage extends StatelessWidget {
  static const double _widgetWidth = 300;
  const HomePage({super.key});

  Offset _getHourOrMinuteOffset(
      final double slice, final int index, final double radio) {
    final angle = slice * index;
    final x = radio * cos(angle);
    final y = radio * sin(angle);
    return Offset(x, y);
  }

  @override
  Widget build(BuildContext context) {
    final List<int> hours = List.generate(12, (index) => index);
    final List<int> minutes = List.generate(12, (index) => 12 + index);

    const double hoursRadio = (_widgetWidth * 0.8) / 2;
    const double minutesRadio = (_widgetWidth * 0.5) / 2;

    final double hoursSlice = 2 * pi / hours.length;
    final double minutesSlice = 2 * pi / minutes.length;

    final int hourSelected = hours[Random().nextInt(hours.length - 1)];
    final int minuteSelected = minutes[Random().nextInt(minutes.length - 1)];
    final Offset hourSelectedPos =
        _getHourOrMinuteOffset(hoursSlice, hourSelected, hoursRadio);
    final Offset minuteSelectedPos =
        _getHourOrMinuteOffset(minutesSlice, minuteSelected, minutesRadio);

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
              Row(
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
                      hourSelected.toString(),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xff454d50),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      minuteSelected.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Container(
                height: _widgetWidth,
                width: _widgetWidth,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff454d50),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: _widgetWidth * 0.04,
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
                      final pos =
                          _getHourOrMinuteOffset(hoursSlice, index, hoursRadio);
                      return Transform.translate(
                        offset: pos,
                        child: Container(
                          width: _widgetWidth * 0.16,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isSelected
                                ? Colors.lightBlue[500]
                                : Colors.transparent,
                          ),
                          child: Text(
                            hours[index].toString(),
                            style: TextStyle(
                              color:
                                  !isSelected ? Colors.grey[400] : Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    }),
                    CustomPaint(
                      size: const Size(0, 0),
                      painter: LinePaint(linePos: minuteSelectedPos),
                    ),
                    ...List.generate(minutes.length, (index) {
                      final Offset pos = _getHourOrMinuteOffset(
                          minutesSlice, index, minutesRadio);
                      final isSelected = minuteSelected == minutes[index];
                      return Transform.translate(
                        offset: pos,
                        child: Container(
                          width: _widgetWidth * 0.1,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isSelected
                                ? Colors.lightBlue[500]
                                : Colors.transparent,
                          ),
                          child: Text(
                            minutes[index].toString(),
                            style: TextStyle(
                              color:
                                  !isSelected ? Colors.grey[400] : Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
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

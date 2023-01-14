import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.background,
      child: TableCalendar(
        availableGestures: AvailableGestures.none,
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          leftChevronIcon:
              Icon(Icons.arrow_left, color: Color.fromARGB(255, 224, 189, 234)),
          rightChevronIcon: Icon(Icons.arrow_right,
              color: Color.fromARGB(255, 224, 189, 234)),
          titleTextStyle:
              TextStyle(color: ColorPalette.pink, fontWeight: FontWeight.bold),
        ),
        daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle: TextStyle(color: ColorPalette.lightGreen)),
        calendarStyle: const CalendarStyle(
          cellMargin: EdgeInsets.all(5),
          defaultTextStyle: TextStyle(color: ColorPalette.pink),
          weekendTextStyle:
              TextStyle(color: Color.fromARGB(255, 228, 176, 239)),
          todayDecoration: BoxDecoration(
            color: ColorPalette.pink,
            shape: BoxShape.circle,
          ),
          isTodayHighlighted: true,
          selectedDecoration: BoxDecoration(
            color: ColorPalette.lightPurple,
            shape: BoxShape.circle,
          ),
          selectedTextStyle: TextStyle(color: Colors.white),
        ),
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          // Use `selectedDayPredicate` to determine which day is currently selected.
          // If this returns true, then `day` will be marked as selected.

          // Using `isSameDay` is recommended to disregard
          // the time-part of compared DateTime objects.
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            // Call `setState()` when updating the selected day
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            // Call `setState()` when updating calendar format
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: must_be_immutable
class DefCalender extends StatefulWidget {
   DefCalender({super.key});

  @override
  State<DefCalender> createState() => _DefCalenderState();
    DateTime? selectedDay;

  DateTime focusedDay = DateTime.now();

  DateTime? calendarFormat;

  DateTime? currentDay;

  CalendarFormat format = CalendarFormat.month;
}

class _DefCalenderState extends State<DefCalender> {
   void _isSelected(DateTime day, DateTime today) {
      setState(() {});

      widget.focusedDay = day;
    }
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text('Note Tasks Calender',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 30, fontWeight: FontWeight.bold))),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 2,
              width: 30,
              color: Colors.amber,
            ),
            const SizedBox(
              height: 3,
            ),
            Container(
              height: 2,
              width: 50,
              color: Colors.amber,
            ),
            const SizedBox(
              height: 3,
            ),
            Container(
              height: 2,
              width: 30,
              color: Colors.amber,
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Text(
                    'Today Date is  ${widget.focusedDay.toString().split(" ")[0]}',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[600])),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[300],
              ),
              child: TableCalendar(
                headerStyle: const HeaderStyle(
                  
                    titleTextStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    headerPadding: EdgeInsets.all(10),
                    headerMargin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                    titleCentered: true,
                    formatButtonVisible: false,
                    
                    decoration: BoxDecoration(
                      
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(25)))),

                currentDay: widget.currentDay,
                focusedDay: widget.focusedDay,
                locale: 'en_Us',
                onFormatChanged: (CalendarFormat format) {
                  setState(() {
                    widget.format = format;
                  });
                },
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                onDaySelected: _isSelected,

                selectedDayPredicate: (DateTime day) {
                  return isSameDay(day, widget.focusedDay);
                },

                calendarStyle: CalendarStyle(
                  todayTextStyle: const TextStyle(

                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                  disabledTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  defaultTextStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  canMarkersOverflow: true,
                  selectedTextStyle: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                ),

                // daysOfWeekHeight: 50,
                startingDayOfWeek: StartingDayOfWeek.saturday,
                
                weekNumbersVisible: true,
                daysOfWeekHeight: 30,
              ),
            )
          ],
        ),
      );
  }
}
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_una/model/Events.dart';
import 'package:project_una/widgets/appbar.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  CalendarFormat _calenderformat = CalendarFormat.month;
  DateTime _focusday = DateTime.now();
  Map<DateTime, List<Events>> _selectedevents = {};
  TextEditingController _eventcontroller = TextEditingController();
  DateTime _selectedday = DateTime.now();
  final dateFormat = DateFormat(' dd  MMMM  yyyy');

  List<Events> _getEventsFromDay(DateTime date) {
    return _selectedevents[date] ?? [];
  }

  void _updateSelectedEvents() {
    if (_eventcontroller.text.isNotEmpty) {
      if (_selectedevents[_selectedday] != null) {
        _selectedevents[_selectedday]!
            .add(Events(title: _eventcontroller.text));
      } else {
        _selectedevents[_selectedday] = [Events(title: _eventcontroller.text)];
      }
      _eventcontroller.clear();
      setState(() {});
    }
  }

  @override
  void dispose() {
    _eventcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.blue)),
        onPressed: () => showDialog(
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Add Event"),
                content: TextFormField(
                  controller: _eventcontroller,
                  decoration: InputDecoration(hintText: "Enter Event"),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        if (_eventcontroller.text.isEmpty) {
                        } else {
                          if (_selectedevents[_selectedday] != null) {
                            _selectedevents[_selectedday]!
                                .add(Events(title: _eventcontroller.text));
                          } else {
                            _selectedevents[_selectedday] = [
                              Events(title: _eventcontroller.text)
                            ];
                          }
                        }
                        Navigator.pop(context);
                        _eventcontroller.clear();
                        setState(() {});
                        return;
                      },
                      child: Text("Ok")),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Cancel"))
                ],
              );
            },
            context: context),
        child: Icon(Icons.add),
      ),
      appBar: AppBarWidget(text: "Calander"),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w),
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: TableCalendar(
                          daysOfWeekStyle: const DaysOfWeekStyle(
                              weekdayStyle:
                                  TextStyle(fontWeight: FontWeight.bold),
                              weekendStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                          headerStyle: const HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: true,
                            titleTextStyle: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          selectedDayPredicate: (DateTime date) {
                            return isSameDay(_selectedday, date);
                          },
                          focusedDay: _focusday,
                          firstDay: DateTime.utc(1990),
                          lastDay: DateTime.utc(2050),
                          calendarStyle: const CalendarStyle(
                              todayDecoration: BoxDecoration(
                                  color: Colors.orange, shape: BoxShape.circle),
                              selectedDecoration: BoxDecoration(
                                  color: Colors.blue, shape: BoxShape.circle)),
                          onDaySelected: (selectedDay, focusedDay) {
                            if (isSameDay(_selectedday, _focusday)) {
                              setState(() {
                                _selectedday = selectedDay;
                                _focusday = focusedDay;
                              });
                            }
                          },
                          eventLoader: _getEventsFromDay,
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      ..._getEventsFromDay(_selectedday).map((Events events) {
                        return SizedBox(
                            width: 358.w,
                            height: 97.h,
                            child: Card(
                              color: Colors.grey[200],
                              elevation: 0,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(dateFormat.format(_focusday)),
                                        Text(
                                          events.title,
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    // IconButton(onPressed: () {
                                    //   setState(() {
                                    //     _selectedevents[_selectedday]?.clear();
                                    //   });
                                    // }, icon:Icon(Icons.delete)),
                                  ],
                                ),
                              ),
                            ));
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<DateTime>('_selectedday', _selectedday));
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:team_meet/data/get_events.dart';
import 'package:team_meet/data/save_data.dart';
import '../models/event.dart';

class Agenda extends StatefulWidget {
  const Agenda({Key? key}) : super(key: key);

  @override
  State<Agenda> createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final TextEditingController _eventController = TextEditingController();
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  DateFormat dateFormatter = DateFormat('dd/mm/yyyy');
  DateFormat timeFormatter = DateFormat('HH:mm:ss');

  Map<DateTime, List<Event>> selectedEvents = {};

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }

  populateEvents() async {
    List<Event> eventos = await getEvents();

    for (Event evento in eventos) {
      var data = DateTime.parse(evento.data);
      if (selectedEvents[data] != null) {
        selectedEvents[data]?.add(evento);
      } else {
        selectedEvents[data] = [evento];
      }
    }
  }

  @override
  void initState() {
    populateEvents();
    super.initState();
  }

  List<Event> _getEventsFromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2040, 31, 12),
                      calendarFormat: _calendarFormat,
                      focusedDay: _focusedDay,
                      calendarStyle: CalendarStyle(
                        todayTextStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                        todayDecoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            border: Border.all(
                                color: Theme.of(context).colorScheme.primary),
                            shape: BoxShape.circle),
                        selectedTextStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.normal),
                        selectedDecoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            shape: BoxShape.circle),
                        defaultTextStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold),
                      ),
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        if (!isSameDay(_selectedDay, selectedDay)) {
                          setState(
                            () {
                              _selectedDay = selectedDay;
                              _focusedDay = focusedDay;
                            },
                          );
                        }
                      },
                      onFormatChanged: (format) {
                        if (_calendarFormat != format) {
                          setState(
                            () {
                              _calendarFormat = format;
                            },
                          );
                        }
                      },
                      onPageChanged: (focusedDay) {
                        _focusedDay = focusedDay;
                      },
                      eventLoader: _getEventsFromDay,
                    ),
                  ],
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.white,
                        title: const Text("Adicionar evento"),
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(controller: _eventController),
                            ElevatedButton(
                              onPressed: () {
                                _selectTime(context);
                              },
                              child: const Text("Choose Time"),
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white)),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            child: const Text("Cancelar"),
                            onPressed: () => Navigator.pop(context),
                          ),
                          TextButton(
                            child: const Text("Ok"),
                            onPressed: () {
                              String horario = selectedTime.hour.toString() +
                                  ':' +
                                  selectedTime.minute.toString();
                              String dia = _selectedDay.day.toString();
                              String mes = _selectedDay.month.toString();
                              String ano = _selectedDay.year.toString();

                              String data = ano +
                                  '-' +
                                  (int.tryParse(mes)! > 10 ? mes : '0' + mes) + '-' +  (int.tryParse(dia)! > 10 ? dia : '0' + dia);
                              Event ev =
                                  Event(_eventController.text, data, horario);

                              if (_eventController.text.isEmpty) {
                              } else if (selectedEvents[_selectedDay] != null) {
                                saveData('evento', ev);
                                selectedEvents[_selectedDay]?.add(ev);
                              } else {
                                selectedEvents[_selectedDay] = [ev];
                                saveData('evento', ev);
                              }
                              Navigator.pop(context);
                              _eventController.clear();
                              setState(() {});
                              return;
                            },
                          ),
                        ],
                      ),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                      fixedSize: const Size(50, 50),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

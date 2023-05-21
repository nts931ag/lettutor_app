import 'package:flutter/material.dart';
import 'package:lettutor_app/config/theme/text_theme.dart';
import 'package:lettutor_app/domain/models/BookingSchedule.dart';
import 'package:lettutor_app/domain/repositories/api_repository.dart';
import 'package:lettutor_app/locator.dart';
import 'package:lettutor_app/presentation/cubits/schedule/schedule_list_cubit.dart';
import 'package:lettutor_app/presentation/widgets/base/base_scaffold_custom_widget.dart';
import 'package:lettutor_app/utils/resource/data_state.dart';
import 'package:lettutor_app/utils/utils.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen(
      {Key? key, required this.scheduleListCubit, required this.tutorId})
      : super(key: key);

  final ScheduleListCubit scheduleListCubit;
  final String tutorId;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  late final ValueNotifier<List<BookingSchedule>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .disabled; // Can be toggled on/off by longpressing a date
  int _currentTimestamp = DateTime.now().millisecondsSinceEpoch;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  late final ApiRepository _apiRepository;

  @override
  void initState() {
    super.initState();
    _apiRepository = locator<ApiRepository>();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier([]);
    getScheduleOfCurrentOfTutor(
        apiRepository: _apiRepository, tutorId: widget.tutorId);
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<BookingSchedule> _getEventsForDay(DateTime day) {
    // Implementation example
    return _selectedEvents.value;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeSelectionMode = RangeSelectionMode.disabled;
      });

      getScheduleOfCurrentOfTutor(
        apiRepository: _apiRepository,
        tutorId: widget.tutorId,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BaseScaffoldWidgetCustom(
          body: Column(
        children: [
          TableCalendar<BookingSchedule>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: const CalendarStyle(
              // Use `CalendarStyle` to customize the UI
              outsideDaysVisible: false,
              markersMaxCount: 0,
            ),
            onDaySelected: _onDaySelected,
            // onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<BookingSchedule>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                        // color: value[index].isBooked ? greyColor : whiteColor,
                      ),
                      child: ListTile(
                          enabled: checkBookingScheduleAvailable(value[index]),
                          onTap: () => showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return BookingDialog(
                                    title: "Booking class",
                                    onSubmit: (content) {
                                      bookingClass(
                                          apiRepository: _apiRepository,
                                          bookingScheduleSelected: value[index],
                                          content:
                                              content); /*.then(
                                  (value) => */
                                    },
                                  );
                                },
                              ),
                          title: Text(
                            // '${value[index].startTime} - ${value[index].endTime}}',
                            '${formatHourAndMinuteFromTimestamp(value[index].startTimestamp)} - ${formatHourAndMinuteFromTimestamp(value[index].endTimestamp)}',
                            style: text18,
                          ),
                          subtitle: Text(
                            checkBookingScheduleAvailable(value[index])
                                ? 'You can book this class'
                                : value[index].isBooked
                                    ? 'This class is booked'
                                    : 'This class is time up',
                            style: text14,
                          )),
                    );
                  },
                );
              },
            ),
          ),
        ],
      )),
    );
  }

  Future<void> getScheduleOfCurrentOfTutor({
    required ApiRepository apiRepository,
    required String tutorId,
  }) async {
    DateTime(
        _selectedDay!.year, _selectedDay!.month, _selectedDay!.day, 0, 0, 0);
    int startTimestamp = DateTime(
      _selectedDay!.year,
      _selectedDay!.month,
      _selectedDay!.day,
    ).millisecondsSinceEpoch;
    int endTimestamp = startTimestamp + 86399000;

    final response = await apiRepository.getBookingScheduleOfTutor(
        tutorId: tutorId,
        startTimestamp: startTimestamp,
        endTimestamp: endTimestamp);

    if (response is DataSuccess) {
      _selectedEvents.value = response.data!.scheduleOfTutor.isNotEmpty
          ? _sortBookingScheduleList(response.data!.scheduleOfTutor)
          : [];
    }
  }

  Future<String> bookingClass({
    required ApiRepository apiRepository,
    required BookingSchedule bookingScheduleSelected,
    required String content,
  }) async {
    final response = await apiRepository.bookClass(
        scheduleDetailId: [bookingScheduleSelected.scheduleDetails.first.id],
        note: content);

    if (response is DataSuccess) {
      if (response.data!.message == "Book successful") {
        final newSelectedEvents =
            List<BookingSchedule>.from(_selectedEvents.value);
        newSelectedEvents
            .where((element) => element.id == bookingScheduleSelected.id)
            .first
            ?.isBooked = true;
        _selectedEvents.value = _sortBookingScheduleList(newSelectedEvents);
        widget.scheduleListCubit.reloadScheduleListWithPagination();
      }
      return response.data!.message!;
    }
    return 'Booking class fail';
  }

  List<BookingSchedule> _sortBookingScheduleList(
      List<BookingSchedule> bookingSchedules) {
    bookingSchedules.sort(
      (a, b) {
        return a.startTimestamp >= b.startTimestamp ? 1 : -1;
      },
    );
    return bookingSchedules;
  }

  bool checkBookingScheduleAvailable(BookingSchedule bookingSchedule) {
    if (bookingSchedule.startTimestamp < _currentTimestamp ||
        bookingSchedule.isBooked) {
      return false;
    }
    return true;
  }
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 1, kToday.day);

class BookingDialog extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final String title;
  final Function(String message) onSubmit;

  BookingDialog({super.key, required this.title, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: TextField(
        controller: _textEditingController,
        decoration: const InputDecoration(hintText: 'Enter your note here'),
        maxLines: null,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            String report = _textEditingController.text.trim();
            onSubmit(report);
            Navigator.pop(context);
          },
          child: const Text('Book'),
        ),
      ],
    );
  }
}

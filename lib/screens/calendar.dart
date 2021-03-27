import 'package:epilepsy/config/config.dart';
import 'package:epilepsy/utils/epilepsy_icons.dart';
import 'package:epilepsy/utils/sizes.dart';
import 'package:epilepsy/widgets/trainer_card.dart';
import 'package:epilepsy/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen>
    with TickerProviderStateMixin {
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;

  final Map<DateTime, List> _holidays = {
    DateTime(2020, 1, 1): ['New Year\'s Day'],
    DateTime(2020, 1, 6): ['Epiphany'],
    DateTime(2020, 2, 14): ['Valentine\'s Day'],
    DateTime(2020, 4, 21): ['Easter Sunday'],
    DateTime(2020, 4, 22): ['Easter Monday'],
  };

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    _events = {
      _selectedDay.subtract(Duration(days: 30)): [
        'Event A0',
        'Event B0',
        'Event C0'
      ],
      _selectedDay.subtract(Duration(days: 27)): ['Event A1'],
      _selectedDay.subtract(Duration(days: 20)): [
        'Event A2',
        'Event B2',
        'Event C2',
        'Event D2'
      ],
      _selectedDay.subtract(Duration(days: 16)): ['Event A3', 'Event B3'],
      _selectedDay.subtract(Duration(days: 10)): [
        'Event A4',
        'Event B4',
        'Event C4'
      ],
      _selectedDay.subtract(Duration(days: 4)): [
        'Event A5',
        'Event B5',
        'Event C5'
      ],
      _selectedDay.subtract(Duration(days: 2)): ['Event A6', 'Event B6'],
      _selectedDay: ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
      _selectedDay.add(Duration(days: 1)): [
        'Event A8',
        'Event B8',
        'Event C8',
        'Event D8'
      ],
      _selectedDay.add(Duration(days: 3)):
          Set.from(['Event A9', 'Event A9', 'Event B9']).toList(),
      _selectedDay.add(Duration(days: 7)): [
        'Event A10',
        'Event B10',
        'Event C10'
      ],
      _selectedDay.add(Duration(days: 11)): ['Event A11', 'Event B11'],
      _selectedDay.add(Duration(days: 17)): [
        'Event A12',
        'Event B12',
        'Event C12',
        'Event D12'
      ],
      _selectedDay.add(Duration(days: 22)): ['Event A13', 'Event B13'],
      _selectedDay.add(Duration(days: 26)): [
        'Event A14',
        'Event B14',
        'Event C14'
      ],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  Widget _buildTableCalendar() {
    return Container(
      padding:
          const EdgeInsets.only(top: 15.0, left: 9.0, right: 9.0, bottom: 20.0),
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: Palette.scaffoldBackgorund,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(.2),
            blurRadius: 2,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: TableCalendar(
        calendarController: _calendarController,
        events: _events,
        holidays: _holidays,
        startingDayOfWeek: StartingDayOfWeek.monday,
        rowHeight: 50.0,
        daysOfWeekStyle: DaysOfWeekStyle(
          dowTextBuilder: (date, locale) =>
              DateFormat.E(locale).format(date)[0],
          weekdayStyle: TextStyle(
            color: Colors.black,
            fontSize: 13.0,
          ),
          weekendStyle: TextStyle(
            color: Colors.black,
            fontSize: 13.0,
          ),
        ),
        calendarStyle: CalendarStyle(
          selectedColor: Palette.calendarSelected,
          weekendStyle: TextStyle(color: Colors.black, fontSize: 17.0),
          weekdayStyle: TextStyle(color: Colors.black, fontSize: 17.0),
          todayColor: Colors.deepOrange[200],
          markersColor: Palette.calendarMarker,
          outsideDaysVisible: true,
          outsideWeekendStyle:
              TextStyle(color: Palette.calendarOutDays, fontSize: 17.0),
          markersAlignment: Alignment.topRight,
          markersMaxAmount: 1,
          markersPositionTop: -30,
          markersPositionRight: 5,
          markersPositionBottom: 0,
        ),
        headerStyle: HeaderStyle(
          titleTextStyle: TextStyle(
            fontFamily: 'SF-UI-Display',
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Colors.black.withOpacity(.9),
            letterSpacing: 1.1,
          ),
          centerHeaderTitle: true,
          formatButtonVisible: false,
          leftChevronIcon: Icon(
            EpilepsyIcons.left_open,
            size: 16.0,
            color: Palette.grey,
          ),
          rightChevronIcon: Icon(
            EpilepsyIcons.right_open,
            size: 16.0,
            color: Palette.grey,
          ),
        ),
        onDaySelected: _onDaySelected,
        onVisibleDaysChanged: _onVisibleDaysChanged,
        onCalendarCreated: _onCalendarCreated,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(GetSize.width, 100.0),
        child: CustomAppBar(
          onTap: () => Get.back(),
          hasAction: false,
          leading: AppIcons.back,
          title: 'Календарь',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: <Widget>[
            _buildTableCalendar(),
            TrainerCard(),
          ],
        ),
      ),
    );
  }
}

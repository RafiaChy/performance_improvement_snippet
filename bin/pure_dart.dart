import 'dart:math';

// Problem: In the code below, we have historical data about single meditation play actions saved  inside an array
// called “meditationList”. We want to use this array in our calendar function to  display all the single meditation play actions date wise. Unfortunately, the current code is very  slow and not performant. Do you have any idea how to increase the performance?

enum Constants {
  meditation,
  journal,
  note,
  other,
}

abstract class MeditationInterface {
  late DateTime startTime;
  late DateTime endTime;
  late String title;
  late String description;
  late Constants type;
  late int id;
  late int userId;
}

class Meditation implements MeditationInterface {
  @override
  String description;

  @override
  DateTime endTime;

  @override
  DateTime startTime;

  @override
  String title;

  @override
  Constants type;

  @override
  int id;

  @override
  int userId;

  Meditation({
    required this.description,
    required this.endTime,
    required this.startTime,
    required this.title,
    required this.type,
    required this.id,
    required this.userId,
  });
}

abstract class CalenderItemInterface {
  late DateTime date;
  late List<Meditation> activities;
}

class CalenderItem implements CalenderItemInterface {
  @override
  DateTime date;
  @override
  List<Meditation> activities;
  CalenderItem({
    required this.date,
    required this.activities,
  }) {
    // sort the activities id wise
    activities.sort((a, b) => a.id.compareTo(b.id));
  }
}

abstract class CalendarInterface {
  late List<CalenderItem> days;
}

class Calendar implements CalendarInterface {
  @override
  List<CalenderItem> days;
  Calendar({
    required this.days,
  });
}

void test() {
  // no of meditation done overall
  int totalMeditation = 0;

  // no of users
  int totalUsers = 0;

  // create a list  of CalenderItem
  List<CalenderItem> calenderItems = [];
  for (int i = 0; i < 10; i++) {
    // create a list of Meditation
    List<Meditation> meditationList = [];
    for (int j = 0; j < Random().nextInt(5); j++) {
      Meditation meditation = Meditation(
        description: 'description',
        endTime: DateTime.now(),
        startTime: DateTime.now(),
        title: 'title',
        type: Constants.meditation,
        id: totalMeditation,
        userId: totalUsers,
      );
      meditationList.add(meditation);
      totalMeditation++;
      totalUsers++;
    }
    // create a CalenderItem
    CalenderItem calenderItem = CalenderItem(
      date: DateTime.now().add(Duration(days: i)),
      activities: meditationList,
    );
    calenderItems.add(calenderItem);
  }

  // create a Calendar
  Calendar calendar = Calendar(
    days: calenderItems,
  );

  // print no of meditation done each day in calendar
  for (int i = 0; i < calendar.days.length; i++) {
    print(
        'on ${calendar.days[i].date} ${calendar.days[i].activities.length} no of meditation was done');
  }
}

void main() {
  test();
}

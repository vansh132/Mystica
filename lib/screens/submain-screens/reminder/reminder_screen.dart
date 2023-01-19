import 'package:flutter/material.dart';
import 'package:mytica/models/reminder/reminder.dart';
import 'package:mytica/widgets/Items/add_reminder.dart';
import 'package:mytica/widgets/Items/reminder_item.dart';
import 'package:mytica/widgets/navigation.dart';
import 'package:pie_chart/pie_chart.dart';

class ReminderScreen extends StatefulWidget {
  static const String routeName = '/reminder-screen';
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  List<Reminder> reminderList = [
    Reminder(
      id: 1,
      title: "Project Deadline",
      selectedDate: DateTime.now(),
    ),
    Reminder(
      id: 2,
      title: "Project Deadline 2",
      selectedDate: DateTime.now(),
    ),
    Reminder(
      id: 3,
      title: "Project Deadline 3",
      selectedDate: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    void _addNewTask(String task) {
      print(task);
      // _db = AppDb();
      // int id = await userId;

      // final todoEntity = TodosCompanion(
      //     title: drift.Value(task),
      //     isCompleted: drift.Value(0),
      //     userId: drift.Value(id));
      // print(todoEntity);
      // int res = await _db.insertTodo(todoEntity);
      // if (res != 0) {
      //   print("Todo added: $res");

      // }
      // await _db.close();
    }

    void _startAddReminderTransaction(BuildContext ctx) {
      print("inside _startAddTaskTransaction...");
      showModalBottomSheet(
          context: ctx,
          builder: (_) {
            return GestureDetector(
              onTap: () {},
              child: AddReminder(_addNewTask),
              behavior: HitTestBehavior.opaque,
              // behavior is important to catch the action like  onTap
            );
          });
    }

    Map<String, double> dataMap = {
      "Jan-Mar": 5,
      "Apr-Jun": 3,
      "July-Sept": 2,
      "Oct-Dec": 6,
    };
    return Scaffold(
      appBar: AppBar(
        title: Text("Reminder"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xffADD8FF), Color(0xffEBF5FF)], //final - 1
              stops: [0.4, 0.7],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Row(
          children: [
            Container(
              color: const Color(0xff001427),
              width: MediaQuery.of(context).size.width * 0.12,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: const [
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Quote of the Day",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Color(0xffCAF0F8)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "\" Life is either a daring adventure or nothing at all \"",
                    style: TextStyle(
                        fontWeight: FontWeight.w300, color: Color(0xffedf6f9)),
                    textAlign: TextAlign.center,
                  ),
                  NavigationRow()
                ],
              ),
            ),
            const VerticalDivider(
              width: 4,
              color: Colors.grey,
            ),
            Container(
              padding: const EdgeInsets.all(32),
              width: MediaQuery.of(context).size.width * 0.7,
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    reminder_item(reminderList[index], index),
                itemCount: reminderList.length,
              ),
            ),
            const VerticalDivider(
              width: 4,
              color: Colors.grey,
            ),
            Container(
              // color: Colors.white,
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width * 0.1745,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "Reminder Overview:",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(
                    height: 2,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    // color: Colors.amber,
                    padding: const EdgeInsets.all(8),
                    width: 250,
                    height: 250,
                    child: PieChart(
                      dataMap: dataMap,
                      animationDuration: const Duration(milliseconds: 1000),
                      chartLegendSpacing: 32,
                      chartRadius: MediaQuery.of(context).size.width / 3.2,
                      initialAngleInDegree: 0,
                      chartType: ChartType.ring,
                      ringStrokeWidth: 32,
                      centerText: "",
                      // colorList: colorList,
                      legendOptions: const LegendOptions(
                        showLegendsInRow: false,
                        legendPosition: LegendPosition.bottom,
                        showLegends: true,
                        // legendShape: BoxShape.rectangle,
                        legendTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      chartValuesOptions: const ChartValuesOptions(
                        showChartValueBackground: true,
                        showChartValues: true,
                        showChartValuesInPercentage: false,
                        showChartValuesOutside: false,
                        decimalPlaces: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: C,
                      children: [
                        const Text(
                          "Reminders: ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "10",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Add Reminder"),
        icon: const Icon(Icons.add_alarm_rounded),
        onPressed: () => _startAddReminderTransaction(context),
      ),
    );
  }
}

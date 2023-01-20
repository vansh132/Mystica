import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:mytica/data/local/db/app_db.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:mytica/screens/submain-screens/album/album_screen.dart';
import 'package:mytica/screens/submain-screens/journal/journal_screen.dart';
import 'package:mytica/screens/submain-screens/notebook/notebook_screen.dart';
import 'package:mytica/screens/submain-screens/reminder/reminder_screen.dart';
import 'package:mytica/screens/submain-screens/todo/todo_screen.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linecons_icons.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home-screen';
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = <ChartData>[
      ChartData("January", 10, 5, 3, 12, 2),
      ChartData("February", 0, 1, 3, 1, 2),
      ChartData("March", 10, 5, 3, 12, 2),
      ChartData("April", 5, 2, 1, 0, 1),
      ChartData("May", 10, 5, 3, 12, 2),
      ChartData("June", 10, 5, 3, 12, 2),
      ChartData("July", 3, 6, 3, 4, 6),
      ChartData("August", 3, 6, 3, 4, 6),
      ChartData("Sept", 3, 6, 3, 4, 6),
      ChartData("October", 2, 2, 2, 2, 2),
      ChartData("November", 15, 12, 9, 11, 8),
      ChartData("December", 15, 12, 9, 11, 8),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home screen"),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffADD8FF), Color(0xffEBF5FF)], //final - 1
                stops: [0.4, 0.7],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          //Dashboard
          Container(
            padding: const EdgeInsets.all(8),
            height: MediaQuery.of(context).size.height * 0.42,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: Color(0xff000814),
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: SfCartesianChart(
                plotAreaBorderWidth: 0,
                enableAxisAnimation: true,
                margin: EdgeInsets.all(16),
                primaryXAxis: CategoryAxis(
                  labelStyle: TextStyle(
                    color: Color(0xffc7f9cc),
                    letterSpacing: 0.75,
                  ),
                  majorTickLines: MajorTickLines(width: 0),
                  majorGridLines: MajorGridLines(width: 0),
                  axisLine: AxisLine(width: 0),
                ),
                crosshairBehavior: CrosshairBehavior(lineWidth: 10),
                palette: const [
                  Color(0xff590d22), //1
                  Color(0xffa4133c), //4
                  Color(0xffff4d6d), //2
                  Color(0xffff8fa3), //5
                  Color(0xffffccd5), //3
                ],
                primaryYAxis: NumericAxis(
                    labelStyle: TextStyle(
                      color: Color(0xffc7f9cc),
                      letterSpacing: 0.75,
                    ),
                    majorGridLines: MajorGridLines(width: 0),
                    axisLine: AxisLine(width: 0)),
                legend: Legend(
                    isVisible: true,
                    position: LegendPosition.bottom,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                title: ChartTitle(
                    text: "Overview",
                    textStyle: TextStyle(
                      color: Colors.white,
                    )),
                series: <ChartSeries>[
                  StackedColumn100Series<ChartData, String>(
                      dataSource: chartData,
                      name: "Journal",
                      xValueMapper: (ChartData data, _) => data.year,
                      yValueMapper: (ChartData data, _) => data.journals),
                  StackedColumn100Series<ChartData, String>(
                      dataSource: chartData,
                      name: "Notebook",
                      xValueMapper: (ChartData data, _) => data.year,
                      yValueMapper: (ChartData data, _) => data.notebook),
                  StackedColumn100Series<ChartData, String>(
                      dataSource: chartData,
                      name: "Album",
                      xValueMapper: (ChartData data, _) => data.year,
                      yValueMapper: (ChartData data, _) => data.album),
                  StackedColumn100Series<ChartData, String>(
                      dataSource: chartData,
                      name: "To-Do",
                      xValueMapper: (ChartData data, _) => data.year,
                      yValueMapper: (ChartData data, _) => data.todo),
                  StackedColumn100Series<ChartData, String>(
                      dataSource: chartData,
                      name: "Reminder",
                      xValueMapper: (ChartData data, _) => data.year,
                      yValueMapper: (ChartData data, _) => data.reminder),
                ]),
          ),
          SizedBox(
            height: 8,
          ),
          //Navigation
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.24,
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(JournalScreen.routeName);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 104,
                    width: 148,
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.transparent,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          FontAwesome5.journal_whills,
                          size: 28,
                          color: Color(0xff001427),
                        ),
                        Text(
                          "Journal",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff171214),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(NotebookScreen.routeName);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 104,
                    width: 148,
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.transparent,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          FontAwesome5.sticky_note,
                          size: 28,
                          color: Color(0xff001427),
                        ),
                        Text(
                          "Notebook",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff171214),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(AlbumScreen.routeName);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 104,
                    width: 148,
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.transparent,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.photo_album_rounded,
                          size: 28,
                          color: Color(0xff001427),
                        ),
                        Text(
                          "Album",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff171214),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(TodoScreen.routeName);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 104,
                    width: 148,
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.transparent,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          FontAwesome5.tasks,
                          size: 28,
                          color: Color(0xff001427),
                        ),
                        Text(
                          "To - Do",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff171214)),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(ReminderScreen.routeName);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 104,
                    width: 148,
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.transparent,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.photo_album_rounded,
                          size: 28,
                          color: Color(0xff001427),
                        ),
                        Text(
                          "Reminder",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff171214),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //section 1

                //section 2
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class ChartData {
  ChartData(
    this.year,
    this.journals,
    this.notebook,
    this.album,
    this.todo,
    this.reminder,
  );
  final String year;
  final int journals;
  final int notebook;
  final int album;
  final int todo;
  final int reminder;
}

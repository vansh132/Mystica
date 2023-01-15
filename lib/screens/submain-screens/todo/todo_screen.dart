import 'package:flutter/material.dart';
import 'package:mytica/models/todo/todo.dart';
import 'package:mytica/widgets/Items/todo_item.dart';
import 'package:mytica/widgets/navigation.dart';
import 'package:pie_chart/pie_chart.dart';

class TodoScreen extends StatelessWidget {
  static const String routeName = '/todo-screen';
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<TODO> todoList = [
      TODO(
        id: "1",
        title: "title",
        isCompleted: false,
        createdAt: DateTime.now(),
      ),
      TODO(
        id: "2",
        title: "title2",
        isCompleted: false,
        createdAt: DateTime.now(),
      ),
      TODO(
        id: "3",
        title: "title3",
        isCompleted: false,
        createdAt: DateTime.now(),
      ),
      TODO(
        id: "4",
        title: "title4",
        isCompleted: false,
        createdAt: DateTime.now(),
      ),
      TODO(
        id: "5",
        title: "title5",
        isCompleted: false,
        createdAt: DateTime.now(),
      ),
    ];

    Map<String, double> dataMap = {
      "Jan-Mar": 5,
      "Apr-Jun": 3,
      "July-Sept": 2,
      "Oct-Dec": 6,
    };

    return Scaffold(
        appBar: AppBar(
          title: Text("To-do"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffADD8FF), Color(0xffEBF5FF)], //final - 1
                  stops: [0.4, 0.7],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
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
                          fontWeight: FontWeight.w600,
                          color: Color(0xffCAF0F8)),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "\" Life is either a daring adventure or nothing at all \"",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Color(0xffedf6f9)),
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
                    itemBuilder: (context, index) => todo_item(todoList[index]),
                    itemCount: todoList.length,
                  )),
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
                      "Journal Overview:",
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
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Journal count: ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "length",
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.of(context)
            //     .pushNamed(CreateJournalScreen.routeName)
            //     .then((value) => setState(() {}));
          },
          child: const Icon(Icons.add),
        ));
  }
}

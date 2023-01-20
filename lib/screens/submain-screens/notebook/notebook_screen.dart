import 'package:flutter/material.dart';
import 'package:mytica/data/local/db/app_db.dart';
import 'package:mytica/screens/submain-screens/notebook/create_notebook_screen.dart';
import 'package:mytica/widgets/Items/journal_item.dart';
import 'package:mytica/widgets/Items/notebook_item.dart';
import 'package:mytica/widgets/navigation.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotebookScreen extends StatefulWidget {
  static const String routeName = '/notebook-screen';
  const NotebookScreen({super.key});

  @override
  State<NotebookScreen> createState() => _NotebookScreenState();
}

class _NotebookScreenState extends State<NotebookScreen> {
  late AppDb _db;

  int userId = 0;

  void getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final int? id = prefs.getInt('userId');
    if (id != null) {
      userId = id;
    }
  }

  @override
  void initState() {
    getUserId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Jan-Mar": 5,
      "Apr-Jun": 3,
      "July-Sept": 2,
      "Oct-Dec": 6,
    };
    _db = AppDb();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notebook"),
      ),
      body: FutureBuilder<List<Notebook>>(
        future: _db.getNotebookByUserId(1),
        builder: ((context, snapshot) {
          final List<Notebook>? notebooks = snapshot.data;
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (notebooks != null) {
            _db.close();
            return Container(
              // padding: EdgeInsets.all(16),
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xffADD8FF),
                Color(0xffEBF5FF)
              ], //final - 1
                      stops: [
                    0.4,
                    0.7
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
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
                    child: GridView.builder(
                      itemCount: notebooks.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 2 / 2,
                              crossAxisSpacing: 45,
                              mainAxisSpacing: 35),
                      itemBuilder: (context, index) =>
                          NotebookItem(notebooks[index]),
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
                          "Notebook Overview:",
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
                            animationDuration:
                                const Duration(milliseconds: 1000),
                            chartLegendSpacing: 32,
                            chartRadius:
                                MediaQuery.of(context).size.width / 3.2,
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
                                "Notebook count: ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                "${notebooks.length}",
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
            );
          }
          return const Center(
            child: Text("0 entires found"),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _db.close();
          Navigator.of(context)
              .pushNamed(CreateNotebookScreen.routeName)
              .then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


//



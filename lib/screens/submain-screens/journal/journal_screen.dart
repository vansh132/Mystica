import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mytica/data/local/db/app_db.dart';
import 'package:mytica/screens/submain-screens/journal/create_journal_screen.dart';
import 'package:mytica/widgets/Items/journal_item.dart';
import 'package:mytica/widgets/navigation.dart';
import 'package:pie_chart/pie_chart.dart';

class JournalScreen extends StatefulWidget {
  static const String routeName = '/journal-screen';
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  late AppDb _db;

  @override
  void initState() {
    super.initState();

    // _db = AppDb();
  }

  // @override
  // void dispose() {
  //   _db.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    _db = AppDb();

    Map<String, double> dataMap = {
      "Jan-Mar": 5,
      "Apr-Jun": 3,
      "July-Sept": 2,
      "Oct-Dec": 6,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Journal")),
        actions: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Row(
                  children: [
                    TextButton(
                      child: const Text(
                        "Log out",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        print("Log out ");
                      },
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Icon(Icons.logout_rounded),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              )),
        ],
      ),
      body: FutureBuilder<List<Journal>>(
        future: _db.getJournals(),
        builder: ((context, snapshot) {
          final List<Journal>? journals = snapshot.data;
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

          if (journals != null) {
            return Container(
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
                      children: [
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
                        NavigationRow(),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  // margin: EdgeInsets.all(8),

                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(24),
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black54,
                                        offset: Offset(0.0, 2.0), //(x,y)
                                        blurRadius: 6.0,
                                      ),
                                    ],
                                  ),
                                  // color: Colors.yellow,
                                  height: 72,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: CircleAvatar(
                                          radius: 30,
                                          // backgroundColor: Colors.white,
                                          backgroundImage: FileImage(File(
                                              "C:/Users/hpCND/OneDrive/Desktop/Mini Project/album_cover/cover_3.jpg")),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Vansh Shah",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.white,
                                                // letterSpacing: 0.5,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              "vansh132",
                                              style: TextStyle(
                                                color: Colors.white,
                                                letterSpacing: 0.5,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
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
                      itemCount: journals.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 4.5 / 3,
                              crossAxisSpacing: 40,
                              mainAxisSpacing: 35),
                      itemBuilder: (context, index) =>
                          JournalItem(journals[index]),
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
                                "Journal count: ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                "${journals.length}",
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
              .pushNamed(CreateJournalScreen.routeName)
              .then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

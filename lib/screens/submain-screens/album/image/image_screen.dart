import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytica/data/local/db/app_db.dart';
import 'package:mytica/screens/submain-screens/album/image/add_image_screen.dart';
import 'package:mytica/widgets/Items/image_item.dart';
import 'package:mytica/widgets/navigation.dart';
import 'package:pie_chart/pie_chart.dart';

class ImageScreen extends StatefulWidget {
  static const String routeName = '/image-screen';
  const ImageScreen({super.key});
  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  late AppDb _db;

  @override
  Widget build(BuildContext context) {
    _db = AppDb();
    //Remark: stored albumId through navigation
    final album = ModalRoute.of(context)!.settings.arguments as Album;
    print(album);
    //To-do: Retrieve the album name
    //To-do: Retrieve the images of an album

    Map<String, double> dataMap = {
      "Jan-Mar": 5,
      "Apr-Jun": 3,
      "July-Sept": 2,
      "Oct-Dec": 6,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Images")),
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
      body: FutureBuilder<List<MyImage>>(
        future: _db.getImageByAlbumId(album.id),
        builder: ((context, snapshot) {
          final List<MyImage>? myImages = snapshot.data;
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

          if (myImages != null) {
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
                    // color: Colors.red,
                    padding: const EdgeInsets.all(32),
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: GridView.builder(
                      itemCount: myImages.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1 / 1,
                        crossAxisSpacing: 40,
                        mainAxisSpacing: 36,
                      ),
                      itemBuilder: (context, index) =>
                          ImageItem(myImages[index]),
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
                          "Album   Overview:",
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
                        Text(
                          album.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          album.description,
                          style: const TextStyle(
                            fontSize: 18,
                            letterSpacing: 0.75,
                            fontWeight: FontWeight.w700,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.calendar_month_rounded),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              DateFormat.yMMMMd().format(album.createdAt),
                              style: const TextStyle(
                                fontSize: 16,
                                letterSpacing: 0.75,
                                fontWeight: FontWeight.w700,
                                // color: Colors.black54,
                              ),
                            ),
                          ],
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
                        const Text(
                          "Image  Overview:",
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
                                "Images: ",
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
                  ),
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
          Navigator.of(context)
              .pushNamed(AddImageScreen.routeName, arguments: album)
              .then((value) => setState(() {}));
          /* showModalBottomSheet(
            context: context,
            builder: (_) {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: const NewImage(),
              );
            },
          ); */
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

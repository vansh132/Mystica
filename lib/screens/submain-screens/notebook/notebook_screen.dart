import 'package:flutter/material.dart';
import 'package:mytica/data/local/db/app_db.dart';
import 'package:mytica/screens/submain-screens/notebook/create_notebook_screen.dart';
import 'package:mytica/widgets/Items/journal_item.dart';
import 'package:mytica/widgets/Items/notebook_item.dart';
import 'package:mytica/widgets/navigation.dart';
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
                  ],
                ));
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



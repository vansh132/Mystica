import 'package:flutter/material.dart';
import 'package:mytica/models/Journal/Journal.dart';
import 'package:mytica/models/Notebook/Notebook.dart';
import 'package:mytica/widgets/Items/journal_item.dart';
import 'package:mytica/widgets/Items/notebook_item.dart';
import 'package:mytica/widgets/navigation.dart';

class NotebookScreen extends StatelessWidget {
  static const String routeName = '/notebook-screen';
  const NotebookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Notebook> albums = [
      Notebook(
        id: 1,
        name: "Software Engineering",
        description:
            "Lifecycle of software development, Defining, Planning, Designing, Implementation, Testing, Deployment.",
        tag: "#bcuExam",
        createdAt: DateTime.now(),
      ),
      Notebook(
        id: 2,
        name: "ADA - Lab",
        description: "Quick Sort, Binary Search, Merge Sort, Selection Sort.",
        tag: "#practicals",
        createdAt: DateTime.now(),
      ),
      Notebook(
        id: 3,
        name: "Data Mining",
        tag: "#favorite",
        description:
            "Data Warehouse, 3-tier architecture, Data cubes and its operations, OLAP Servers",
        createdAt: DateTime.now(),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Notebook"),
      ),
      body: Container(
          // padding: EdgeInsets.all(16),
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
                color: Color(0xff001427),
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
                  itemCount: albums.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 2 / 2,
                      crossAxisSpacing: 45,
                      mainAxisSpacing: 35),
                  itemBuilder: (context, index) => NotebookItem(albums[index]),
                ),
              ),
              const VerticalDivider(
                width: 4,
                color: Colors.grey,
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /* showModalBottomSheet(
            context: context,
            builder: (_) {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: const NewAlbum(),
              );
            },
          ); */
          //Navigator.of(context).pushNamed(CreateAlbum.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

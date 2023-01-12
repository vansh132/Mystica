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
        id: 'j11',
        name: "IV SEM",
        description: "Theory  ",
        tag: "#yeye",
        createdAt: DateTime.now(),
      ),
      Notebook(
        id: 'j12',
        name: "GAnja Party",
        description: "i was high..",
        tag: "#yeye",
        createdAt: DateTime.now(),
      ),
      Notebook(
        id: 'j13',
        name: "Bangalore Trip",
        tag: "#yeye",
        description: "Final semester trip with Juniors",
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
                width: MediaQuery.of(context).size.width * 0.12,
                child: Column(
                  children: const [NavigationRow()],
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
                      crossAxisCount: 2,
                      childAspectRatio: 5 / 2,
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

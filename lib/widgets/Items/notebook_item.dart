import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import 'package:mytica/models/Notebook/Notebook.dart';

class NotebookItem extends StatelessWidget {
  Notebook notebook;
  NotebookItem(this.notebook);

  @override
  Widget build(BuildContext context) {
    //To-do (Vansh): Change the colors
    const colors = [
      Color.fromRGBO(173, 217, 255, 1),
      Color.fromRGBO(0, 105, 204, 1),
      Color.fromRGBO(0, 95, 184, 1),
      Color.fromRGBO(0, 84, 163, 1),
      Color.fromRGBO(0, 74, 143, 1),
      Color.fromRGBO(0, 63, 122, 1),
      Color.fromRGBO(0, 53, 102, 1),
      Color.fromRGBO(0, 42, 82, 1),
      Color.fromRGBO(0, 32, 61, 1),
      Color.fromRGBO(0, 11, 20, 1),
    ];
    return GridTile(
      footer: Card(
        elevation: 14,
        child: GridTileBar(
          leading: Text(
            notebook.tag,
            style: TextStyle(color: Colors.white60),
          ),
          backgroundColor: Colors.black87, //To-do (Vansh): Change the color
          title: Text(
            DateFormat('dd-MM-yyyy').format(notebook.createdAt),
            textAlign: TextAlign.end,
          ),
/*           trailing: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: EditAlbum(journal.tag),
                    );
                  },
                );
              },
              icon: Icon(Icons.edit)), */
        ),
      ),
      child: GestureDetector(
          onTap: () {},
          child: Card(
            elevation: 14,
            child: Container(
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                colors[Random().nextInt(5)],
                colors[Random().nextInt(9)]
              ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
              child: Column(
                children: [
                  Text(
                    notebook.name,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    notebook.description,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

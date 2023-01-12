import 'package:flutter/material.dart';
import 'package:mytica/models/Gallery/Album.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import 'package:mytica/screens/submain-screens/album/image/image_screen.dart';
import 'package:mytica/screens/submain-screens/album/edit_album_screen.dart';

class AlbumItem extends StatelessWidget {
  Album album;
  AlbumItem(this.album);

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
          leading:
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
          backgroundColor: Colors.black87, //To-do (Vansh): Change the color
          title: Text(
            DateFormat('dd-MM-yyyy').format(album.createdAt),
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditAlbumScreen.routeName, arguments: album.id);
                /*   showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: EditAlbum(album.id), 
                    );
                  },
                ); */
              },
              icon: Icon(Icons.edit)),
        ),
      ),
      child: GestureDetector(
          onTap: () {
            //Navigation: AlbumScreen to ImageScreen
            //Album id passed by argement
            Navigator.of(context)
                .pushNamed(ImageScreen.routeName, arguments: album.id);
          },
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
                    album.title,
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
                    album.desription,
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

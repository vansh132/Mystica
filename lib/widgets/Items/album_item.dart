import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mytica/models/Gallery/Album.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import 'package:mytica/screens/submain-screens/album/image/image_screen.dart';
import 'package:mytica/screens/submain-screens/album/edit_album_screen.dart';
import 'package:fluttericon/elusive_icons.dart';

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
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ImageScreen.routeName, arguments: album.id);
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(File("C:/Users/hpCND/Downloads/DSC_0822.NEF.jpg")),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 2.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                color: Colors.black54,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.transparent,
                    offset: Offset(0.0, 2.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              // color: Colors.black54,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("data"),
                  Text("data"),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                            EditAlbumScreen.routeName,
                            arguments: album);
                      },
                      icon: Icon(
                        Elusive.th_large,
                        color: Colors.white,
                        size: 16,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mytica/models/Gallery/Album.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import 'package:mytica/screens/submain-screens/album/image/image_screen.dart';
import 'package:mytica/screens/submain-screens/album/edit_album_screen.dart';
import 'package:fluttericon/elusive_icons.dart';

class AlbumItem extends StatefulWidget {
  Album album;
  AlbumItem(this.album);

  @override
  State<AlbumItem> createState() => _AlbumItemState();
}

class _AlbumItemState extends State<AlbumItem> {
  @override
  Widget build(BuildContext context) {
    //To-do (Vansh): Change the colors
    File coverImage() {
      final coverImageFiles = [
        File(
            "C:/Users/hpCND/OneDrive/Desktop/Mini Project/album_cover/cover_1.jpg"),
        File(
            "C:/Users/hpCND/OneDrive/Desktop/Mini Project/album_cover/cover_2.jpg"),
        File(
            "C:/Users/hpCND/OneDrive/Desktop/Mini Project/album_cover/cover_3.jpg"),
        File(
            "C:/Users/hpCND/OneDrive/Desktop/Mini Project/album_cover/cover_4.jpg"),
        File(
            "C:/Users/hpCND/OneDrive/Desktop/Mini Project/album_cover/cover_5.jpg"),
        File(
            "C:/Users/hpCND/OneDrive/Desktop/Mini Project/album_cover/cover_6.jpg"),
        File(
            "C:/Users/hpCND/OneDrive/Desktop/Mini Project/album_cover/cover_1.jpg"),
        File(
            "C:/Users/hpCND/OneDrive/Desktop/Mini Project/album_cover/cover_2.jpg"),
        File(
            "C:/Users/hpCND/OneDrive/Desktop/Mini Project/album_cover/cover_3.jpg"),
      ];

      if (widget.album.id >= 9) {
        var n = widget.album.id % 10;
        return coverImageFiles[n - 1];
      }
      return coverImageFiles[widget.album.id - 1];
    }

    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ImageScreen.routeName, arguments: widget.album);
      },
      child: Container(
        // color: Colors.amber,
        
        child: Column(
          children: [
            Container(
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image(
                  image: FileImage(coverImage()),
                  fit: BoxFit.cover,
                  height: 296,
                  width: 296, //492
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              widget.album.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            Text(
              widget.album.desription,
              style: TextStyle(
                fontSize: 20,
                // fontWeight: FontWeight.bold,
                color: Colors.black54,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

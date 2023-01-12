import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mytica/models/Gallery/ImageAttr.dart';

class ImageItem extends StatelessWidget {
  ImageAttr image;
  ImageItem(this.image);

  @override
  Widget build(BuildContext context) {
    //TO-DO: delete the image
    void _deleteImage() {
      print("Image deleted..");
    }

    return Card(
        margin: const EdgeInsets.all(24),
        elevation: 7,
        child: Column(
          children: [
            Container(
              color: Colors.black12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    image.tag,
                    style: TextStyle(fontSize: 16),
                  ),
                  IconButton(
                      onPressed: _deleteImage,
                      icon: Icon(Icons.delete_rounded)),
                  // IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                ],
              ),
            ),
/*             SizedBox(
              height: 8,
            ), */
            Image.file(
              File(image.imagePath),
              fit: BoxFit.cover,
            ),
          ],
        ));
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytica/models/Gallery/ImageAttr.dart';
import 'package:mytica/screens/submain-screens/album/image/detail_image_screen.dart';

class ImageItem extends StatefulWidget {
  ImageAttr image;
  ImageItem(this.image);

  @override
  State<ImageItem> createState() => _ImageItemState();
}

class _ImageItemState extends State<ImageItem> {
  @override
  Widget build(BuildContext context) {
    //TO-DO: delete the image
    void _deleteImage() {
      print("Image deleted..");
    }

    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(DetailImageScreen.routeName, arguments: widget.image);
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
                  image: FileImage(File(widget.image.imagePath)),
                  fit: BoxFit.cover,
                  height: 220,
                  width: 220, //492
                ),
              ),
            ),
            // SizedBox(
            //   height: 8,
            // ),
            // Container(
            //   width: 180,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         DateFormat.yMMMd().format(widget.image.createdAt),
            //         style: TextStyle(
            //           fontSize: 16,
            //           fontWeight: FontWeight.bold,
            //           letterSpacing: 0.2,
            //         ),
            //       ),
            //       Text(
            //         widget.image.tag,
            //         style: TextStyle(
            //           fontSize: 16,
            //           // fontWeight: FontWeight.bold,
            //           color: Colors.black54,
            //           letterSpacing: 0.5,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mytica/models/Gallery/ImageAttr.dart';
import 'package:mytica/screens/submain-screens/album/image/add_image_screen.dart';
import 'package:mytica/widgets/Items/image_item.dart';
import 'package:mytica/widgets/Items/new_image.dart';
import 'package:mytica/widgets/navigation.dart';

class ImageScreen extends StatefulWidget {
  static const String routeName = '/image-screen';
  const ImageScreen({super.key});
  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    //Remark: stored albumId through navigation
    final albumId = ModalRoute.of(context)!.settings.arguments as String;
    print(albumId);
    //To-do: Retrieve the album name
    //To-do: Retrieve the images of an album

    final List<ImageAttr> images = [
      ImageAttr(
          albumId: albumId,
          id: "id1",
          imagePath:
              "C:/Users/hpCND/OneDrive/Desktop/Mini Project/images/1.jpg",
          tag: "#day1",
          createdAt: DateTime.now()),
      ImageAttr(
          albumId: albumId,
          id: "id1",
          tag: "#day1",
          imagePath:
              "C:/Users/hpCND/OneDrive/Desktop/Mini Project/images/1.jpg",
          createdAt: DateTime.now()),
      ImageAttr(
          albumId: albumId,
          tag: "#day1",
          id: "id1",
          imagePath:
              "C:/Users/hpCND/OneDrive/Desktop/Mini Project/images/2.jpg",
          createdAt: DateTime.now()),
      ImageAttr(
          albumId: albumId,
          tag: "#day1",
          id: "id1",
          imagePath:
              "C:/Users/hpCND/OneDrive/Desktop/Mini Project/images/3.jpeg",
          createdAt: DateTime.now()),
      ImageAttr(
          albumId: albumId,
          tag: "#day1",
          id: "id1",
          imagePath:
              "C:/Users/hpCND/OneDrive/Desktop/Mini Project/images/fe.jpg",
          createdAt: DateTime.now()),
      ImageAttr(
          albumId: albumId,
          tag: "#day1",
          id: "id1",
          imagePath:
              "C:/Users/hpCND/OneDrive/Desktop/Mini Project/images/4.jpg",
          createdAt: DateTime.now()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Images")),
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
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width * 0.72,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        height: MediaQuery.of(context).size.height * 0.9,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: ListView.builder(
                          itemBuilder: (context, index) =>
                              ImageItem(images[index]),
                          itemCount: images.length,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const VerticalDivider(
                width: 4,
                color: Colors.grey,
              ),
              Column(
                children: [
                  Text("Tag:"),
                  Text("#day1"),
                  Text("#day2"),
                  Text("#day3"),
                  Text("no of images"),
                  Text("no of tags"),
                  Text("fav"),
                ],
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddImageScreen.routeName);
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

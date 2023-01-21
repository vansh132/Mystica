import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mytica/models/Gallery/Album.dart';
import 'package:mytica/screens/submain-screens/album/create_album_screen.dart';
import 'package:mytica/widgets/Items/album_item.dart';
import 'package:mytica/widgets/navigation.dart';

class AlbumScreen extends StatelessWidget {
  static const String routeName = '/album-screen';
  const AlbumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //To-do: Retrieve Albums from database and convert it into List<Album>.
    final List<Album> albums = [
      Album(
        id: 1,
        title: "Goa Trip",
        desription: "Family Vacation",
        coverImagePath:
            "C:/Users/hpCND/OneDrive/Desktop/Mini Project/album_cover/cover_1.jpg",
        createdAt: DateTime.now(),
      ),
      Album(
        id: 2,
        title: "Gujarat Trip",
        desription: "Final semester trip with Juniors",
        coverImagePath:
            "C:/Users/hpCND/OneDrive/Desktop/Mini Project/album_cover/cover_2.jpg",
        createdAt: DateTime.now(),
      ),
      Album(
        id: 3,
        title: "Bangalore Trip",
        desription: "College Track",
        coverImagePath:
            "C:/Users/hpCND/OneDrive/Desktop/Mini Project/album_cover/cover_3.jpg",
        createdAt: DateTime.now(),
      ),
      Album(
        id: 4,
        title: "Goa Trip",
        desription: "Final semester trip with Juniors",
        coverImagePath:
            "C:/Users/hpCND/OneDrive/Desktop/Mini Project/album_cover/cover_4.jpg",
        createdAt: DateTime.now(),
      ),
      Album(
        id: 5,
        title: "Gujarat Trip",
        desription: "Final semester trip with Juniors",
        coverImagePath:
            "C:/Users/hpCND/OneDrive/Desktop/Mini Project/album_cover/cover_5.jpg",
        createdAt: DateTime.now(),
      ),
      Album(
        id: 11,
        title: "Bangalore Trip",
        desription: "Final semester trip with Juniors",
        coverImagePath:
            "C:/Users/hpCND/OneDrive/Desktop/Mini Project/album_cover/cover_6.jpg",
        createdAt: DateTime.now(),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Album")),
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
                color: Color(0xff001427),
                width: MediaQuery.of(context).size.width * 0.12,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
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
                    NavigationRow(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              // margin: EdgeInsets.all(8),

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
                                // gradient: LinearGradient(
                                //   colors: [
                                //     Color(0xffD6EFFF),
                                //     Color(0xff85D0FF)
                                //   ],
                                // ),
                              ),
                              // color: Colors.yellow,
                              height: 72,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: CircleAvatar(
                                      radius: 30,
                                      // backgroundColor: Colors.white,
                                      backgroundImage: FileImage(File(
                                          "C:/Users/hpCND/OneDrive/Desktop/Mini Project/album_cover/cover_3.jpg")),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Vansh Shah",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            // letterSpacing: 0.5,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "vansh132",
                                          style: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 0.5,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalDivider(
                width: 4,
                color: Colors.grey,
              ),
              Container(
                // color: Colors.red,
                padding: const EdgeInsets.all(32),
                width: MediaQuery.of(context).size.width * 0.8773,
                child: GridView.builder(
                  itemCount: albums.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1 / 1,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 48,
                  ),
                  itemBuilder: (context, index) => AlbumItem(albums[index]),
                ),
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
          Navigator.of(context).pushNamed(CreateAlbum.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

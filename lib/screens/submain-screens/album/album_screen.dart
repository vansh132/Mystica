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
        id: '1',
        title: "Goa Trip",
        desription: "Final semester trip with Juniors",
        createdAt: DateTime.now(),
      ),
      Album(
        id: '2',
        title: "Gujarat Trip",
        desription: "Final semester trip with Juniors",
        createdAt: DateTime.now(),
      ),
      Album(
        id: '3',
        title: "Bangalore Trip",
        desription: "Final semester trip with Juniors",
        createdAt: DateTime.now(),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Album"),
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
                      crossAxisCount: 2,
                      childAspectRatio: 5 / 2,
                      crossAxisSpacing: 45,
                      mainAxisSpacing: 35),
                  itemBuilder: (context, index) => AlbumItem(albums[index]),
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
          Navigator.of(context).pushNamed(CreateAlbum.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class EditAlbumScreen extends StatelessWidget {
  static const routeName = "/edit-album-screen";

  @override
  Widget build(BuildContext context) {
    //TO-DO: update the album
    void _updateAlbum() {
      print("Album updated...");
    }
    //Retriving albumId from Album Item (edit button)
    final albumId = ModalRoute.of(context)?.settings.arguments as String;
    print("Alubm - $albumId");
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffADD8FF), Color(0xffEBF5FF)], //final - 1
                stops: [0.4, 0.7],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 500,
              width: 500,
              color: Colors.red,
              child: Column(
                children: [
                  Text("Album Information"),
                  Text("Name: "),
                  Text("Desciption: "),
                ],
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height,
                // color: Colors.yellow,
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    padding: EdgeInsets.only(
                        top: 10,
                        left: 20,
                        right: 20,
                        bottom: MediaQuery.of(context).viewInsets.bottom + 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          decoration:
                              const InputDecoration(labelText: 'Album name'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          decoration:
                              const InputDecoration(labelText: 'Description'),
                        ),
                        const SizedBox(
                          height: 55,
                        ),
                        ElevatedButton(
                            onPressed: _updateAlbum,
                            child: const Text("Add Album"))
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}

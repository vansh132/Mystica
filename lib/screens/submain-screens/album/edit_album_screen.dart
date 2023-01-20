import 'package:flutter/material.dart';
import 'package:mytica/models/Gallery/Album.dart';

class EditAlbumScreen extends StatefulWidget {
  static const routeName = "/edit-album-screen";

  @override
  State<EditAlbumScreen> createState() => _EditAlbumScreenState();
}

class _EditAlbumScreenState extends State<EditAlbumScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //Retriving albumId from Album Item (edit button)
    final album = ModalRoute.of(context)?.settings.arguments as Album;
    _titleController.text = album.title;
    _descriptionController.text = album.desription;
    //TO-DO: update the album
    void _updateAlbum() {
      final enteredAlbumName = _titleController.text;
      final enteredDescription = _descriptionController.text;
      print(enteredAlbumName);
      print(enteredDescription);
      print("Album updated...");
    }

    void _deleteAlbum() {
      print("Delete album...");
    }

    print("Alubm - $album");
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: _deleteAlbum,
              icon: Icon(
                Icons.delete_forever_rounded,
              ))
        ],
      ),
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
                          controller: _titleController,
                          decoration:
                              const InputDecoration(labelText: 'Album name'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _descriptionController,
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

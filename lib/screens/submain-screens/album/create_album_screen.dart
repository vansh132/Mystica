import 'package:flutter/material.dart';
import 'package:mytica/screens/submain-screens/album/album_screen.dart';

class CreateAlbum extends StatefulWidget {
  static const routeName = "/create-album";
  const CreateAlbum({super.key});

  @override
  State<CreateAlbum> createState() => _CreateAlbumState();
}

class _CreateAlbumState extends State<CreateAlbum> {
  final _albumTitleController = TextEditingController();
  final _albumDescriptionController = TextEditingController();

  void _addAlbumData() {
    final enteredAlbumTitle = _albumTitleController.text;
    final enteredAlbumDescription = _albumDescriptionController.text;

    if (enteredAlbumTitle.isEmpty || enteredAlbumDescription.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Minimum 10 characters of description",
        ),
        duration: Duration(seconds: 4),
      ));
      //Navigator.of(context).pushReplacementNamed(AlbumScreen.routeName);
    }

    //To-do: add album
    print(enteredAlbumTitle);
    print(enteredAlbumDescription);

    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create an album"),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffADD8FF), Color(0xffEBF5FF)], //final - 1
                  stops: [0.4, 0.7],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          // color: Colors.yellow,
          child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              padding: EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 10),
              child: Form(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: const InputDecoration(labelText: 'Album name'),
                    controller: _albumTitleController,
                    onSubmitted: (_) => _addAlbumData(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Description'),
                    controller: _albumDescriptionController,
                    onSubmitted: (_) => _addAlbumData(),
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  ElevatedButton(
                      onPressed: _addAlbumData, child: const Text("Add Album"))
                ],
              ))),
        ));
  }
}

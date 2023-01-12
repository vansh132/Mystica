import 'package:flutter/material.dart';
import 'package:mytica/screens/submain-screens/album/album_screen.dart';

class EditAlbum extends StatefulWidget {
  final String albumId;

  EditAlbum(this.albumId);

  @override
  State<EditAlbum> createState() => _EditAlbumState();
}

class _EditAlbumState extends State<EditAlbum> {
  @override
  void initState() {
    _albumTitleController.text = albumTitle;
    _albumDescriptionController.text = albumDescription;
    print("Album id - " + widget.albumId);
    super.initState();
  }

  final _albumTitleController = TextEditingController();
  final _albumDescriptionController = TextEditingController();

  //To-Do: Retrieve album data

  //To-Do (Vansh): Set initial values to fields
  final albumTitle = 'Goa trip';
  final albumDescription = 'Final semester trip with juniors';

  void _deleteAlbum() {
    //To-do: Delete album 
    print("Album deleted...");
    Navigator.of(context).pop();
  }

  void _editAlbumData() {
    final enteredAlbumTitle = _albumTitleController.text;
    final enteredAlbumDescription = _albumDescriptionController.text;

    if (enteredAlbumTitle.isEmpty || enteredAlbumDescription.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Minimum 10 characters of description",
        ),
        duration: Duration(seconds: 2),
      ));
      Navigator.of(context).pop();
      return;
    }

    //To-do: update the database
    print(enteredAlbumTitle);
    print(enteredAlbumDescription);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 7,
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
                  onSubmitted: (_) => _editAlbumData(),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  controller: _albumDescriptionController,
                  onSubmitted: (_) => _editAlbumData(),
                ),
                const SizedBox(
                  height: 55,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: _editAlbumData,
                        child: const Text("Edit Album")),
                    const SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                        onPressed: _deleteAlbum,
                        child: const Text("Delete Album")),
                  ],
                )
              ],
            ))),
      ),
    );
  }
}

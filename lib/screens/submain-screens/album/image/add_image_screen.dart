import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mytica/data/local/db/app_db.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:drift/drift.dart' as drift;

class AddImageScreen extends StatefulWidget {
  static const routeName = "/add-image-screen";
  const AddImageScreen({super.key});

  @override
  State<AddImageScreen> createState() => _AddImageStateScreen();
}

class _AddImageStateScreen extends State<AddImageScreen> {
  late AppDb _db;

  @override
  void initState() {
    super.initState();
  }

  final _tagController = TextEditingController();
  String pathImage = '';

  @override
  Widget build(BuildContext context) {
    _db = AppDb();

    void _addImage() async {
      final album = ModalRoute.of(context)!.settings.arguments as Album;
      final enteredTag = _tagController.text;

      if (enteredTag.isNotEmpty && pathImage.isNotEmpty) {
        final myImageEntity = MyImagesCompanion(
            tag: drift.Value(enteredTag),
            imageurl: drift.Value(pathImage),
            userId: drift.Value(album.userId),
            albumId: drift.Value(album.id),
            alttext: drift.Value("Image Not Found"),
            createdAt: drift.Value(DateTime.now()));

        int res = await _db.insertImage(myImageEntity);

        if (res != 0) {
          print("Note Added $res");
          await _db.close();
          Navigator.of(context).pop();
        } else {
          showImageNotAddedDialogBox(context);
        }
      } else {
        showFieldCannotBeEmptyDialogBox(context);
      }

      // print(enteredTag);
      // print(pathImage);

      // Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(),
      body: Container(
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
                decoration: const InputDecoration(labelText: 'Tag'),
                controller: _tagController,
                onSubmitted: (_) => _addImage(),
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();

                    if (result != null) {
                      PlatformFile file = result.files.first;
                      String editedPath = file.path.toString();
                      editedPath = editedPath.replaceAll('\\', '/').trim();
                      pathImage = editedPath;
                      // print(file.path);
                    } else {
                      // User canceled the picker
                    }
                  },
                  child: Text("Pick an image")),
              const SizedBox(
                height: 55,
              ),
              ElevatedButton(
                  onPressed: _addImage, child: const Text("Add Image"))
            ],
          )),
    );
  }

  void showFieldCannotBeEmptyDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Fields Empty!"),
        content: const Text("Fields cannot be empty."),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.red,
              padding: const EdgeInsets.all(14),
              child: const Text("Okay"),
            ),
          ),
        ],
      ),
    );
  }

  void showImageNotAddedDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Failed"),
        content: const Text("Notebook Not Added. Please try again later."),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.red,
              padding: const EdgeInsets.all(14),
              child: const Text("Okay"),
            ),
          ),
        ],
      ),
    );
  }
}

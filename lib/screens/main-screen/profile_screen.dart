import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mytica/widgets/navigation.dart';
import 'package:file_picker/file_picker.dart';

String? pathImage;
List<String> profile = [];

class ProfileScreen extends StatefulWidget {
  static const routeName = "/profile-screen";
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    void _profileImage() {
      print(pathImage);
    }

    Map<String, double> dataMap = {
      "Jan-Mar": 5,
      "Apr-Jun": 3,
      "July-Sept": 2,
      "Oct-Dec": 6,
    };
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Settings"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xffADD8FF), Color(0xffEBF5FF)], //final - 1
              stops: [0.4, 0.7],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
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
                        fontWeight: FontWeight.w600, color: Color(0xffCAF0F8)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "\" Life is either a daring adventure or nothing at all \"",
                    style: TextStyle(
                        fontWeight: FontWeight.w300, color: Color(0xffedf6f9)),
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
              width: MediaQuery.of(context).size.width * 0.8770,
              height: MediaQuery.of(context).size.height,
              // color: Colors.red,
              child: Column(
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    child: pathImage != null
                        ? CircleAvatar(
                            backgroundImage: FileImage(
                              File("$pathImage"),
                            ),
                          )
                        : Center(
                            child: Text(
                            "No profile Image",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              // backgroundColor: Colors.black,
                              // color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    // child: Image.file(
                    //   File("C:/Users/hpCND/Downloads/StudentPhoto.jpg"),
                    //   fit: BoxFit.cover,
                    //   height: 200,
                    // ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextButton(
                    onPressed: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(type: FileType.image);

                      if (result != null) {
                        PlatformFile file = result.files.first;
                        String editedPath = file.path.toString();
                        editedPath = editedPath.replaceAll('\\', '/').trim();
                        // print(file.path);
                        profile.add(editedPath);
                        setState(() {
                          pathImage = editedPath;
                        });
                      } else {
                        // User canceled the picker
                      }
                    },
                    child: Text(
                      "Change Profile Picture",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: _profileImage,
                  //   child: const Text("Save Profile"),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mytica/screens/sub-screens/image_screen.dart';
import 'package:mytica/screens/submain-screens/album/create_album_screen.dart';
import 'package:mytica/widgets/Items/edit_journal.dart';
import './screens/main-screen/get_started_screen.dart';
import './screens/main-screen/home_screen.dart';
import './screens/main-screen/login_screen.dart';
import './screens/main-screen/signup_screen.dart';
import 'package:mytica/screens/submain-screens/album/album_screen.dart';
import 'package:mytica/screens/submain-screens/journal_screen.dart';
import 'package:mytica/screens/submain-screens/notebook_screen.dart';
import 'package:mytica/screens/submain-screens/reminder_screen.dart';
import 'package:mytica/screens/submain-screens/todo_screen.dart';
import 'package:mytica/screens/testing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Map<int, Color> c = {
    50: const Color.fromRGBO(173, 217, 255, 1),
    100: const Color.fromRGBO(0, 105, 204, 1),
    200: const Color.fromRGBO(0, 95, 184, 1),
    300: const Color.fromRGBO(0, 84, 163, 1),
    400: const Color.fromRGBO(0, 74, 143, 1),
    500: const Color.fromRGBO(0, 63, 122, 1),
    600: const Color.fromRGBO(0, 53, 102, 1),
    700: const Color.fromRGBO(0, 42, 82, 1),
    800: const Color.fromRGBO(0, 32, 61, 1),
    900: const Color.fromRGBO(0, 11, 20, 1),
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialColor myColor = MaterialColor(0xff001427, c);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: myColor,
      ),
      home: GetStartedScreen(),
      routes: {
        //main-screens
        LoginScreen.routeName: ((ctx) => LoginScreen()),
        SignUpScreen.routeName: (ctx) => SignUpScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        //submain-screens
        NotebookScreen.routeName: (ctx) => const NotebookScreen(),
        JournalScreen.routeName: (ctx) => const JournalScreen(),
        EditJournal.routeName: (ctx) => const EditJournal(),
        AlbumScreen.routeName: (ctx) => const AlbumScreen(),
        CreateAlbum.routeName:(ctx) => const CreateAlbum(),
        TodoScreen.routeName: (ctx) => const TodoScreen(),
        ReminderScreen.routeName: (ctx) => const ReminderScreen(),
        //sub-screens
        ImageScreen.routeName: (ctx) => const ImageScreen(),
        //testing-screen
        TestingScreen.routeName: (ctx) => TestingScreen()
      },
    );
  }
}

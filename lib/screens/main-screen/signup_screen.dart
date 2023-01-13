import 'package:flutter/material.dart';
import 'package:mytica/screens/main-screen/login_screen.dart';
import 'package:drift/drift.dart' as drift;
import '../../data/local/db/app_db.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signup-screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late AppDb _db;

  @override
  void initState() {
    super.initState();
    _db = AppDb();
  }

  final _fullnameSignupEditController = TextEditingController();
  final _usernameSignupEditController = TextEditingController();
  final _passwrodSignupEditController = TextEditingController();

  @override
  void dispose() {
    _db.close();
    // _fullnameSignupEditController.dispose();
    // _usernameSignupEditController.dispose();
    // _passwrodSignupEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign up"),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/image3.jpg"),
                  fit: BoxFit.cover)),
          padding: const EdgeInsets.all(32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(48),
                child: Card(
                  elevation: 7,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color(0xffEBF5FF),
                            Color(0xffADD8FF)
                          ], //final - 1
                          stops: [
                            0.4,
                            0.7
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft),
                    ),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.30,
                    // color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(64.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/login_logo.png"))),
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                const Text(
                                  "Mystica",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 36,
                          ),
                          Text(
                            "Join Us",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Gratitude is the sign of noble souls,",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "Become one.",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: _fullnameSignupEditController,
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Enter Full Name'),
                          ),
                          TextFormField(
                            controller: _usernameSignupEditController,
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Create Username'),
                          ),
                          TextFormField(
                            controller: _passwrodSignupEditController,
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Create Password'),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          SizedBox(
                            height: 36,
                            child: ElevatedButton(
                              onPressed: () {
                                print("checking creditentials");
                                int res = 0;
                                if (_usernameSignupEditController.text.isNotEmpty &&
                                    _fullnameSignupEditController
                                        .text.isNotEmpty &&
                                    _passwrodSignupEditController
                                        .text.isNotEmpty) {
                                  final userEntity = UsersCompanion(
                                      username: drift.Value(
                                          _usernameSignupEditController.text
                                              .toLowerCase()),
                                      fullname: drift.Value(
                                          _fullnameSignupEditController.text),
                                      password: drift.Value(
                                          _passwrodSignupEditController.text));
                                  _db.insertUser(userEntity).then((value) => {
                                        value != 0
                                            ? Navigator.of(context).pop()
                                            : 1
                                      });
                                }

                                Navigator.of(context)
                                    .pushNamed(LoginScreen.routeName);
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account? ",
                                style: TextStyle(),
                                textAlign: TextAlign.center,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        LoginScreen.routeName);
                                  },
                                  child: Text("Login"))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 36,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(48),
                child: Container(
                  /* decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Color(0xffEBF5FF),
                      Color(0xffADD8FF)
                    ], //final - 1
                            stops: [
                          0.4,
                          0.7
                        ], begin: Alignment.topRight, end: Alignment.bottomLeft)), */
                  alignment: Alignment.center,
                  color: Colors.black87, //To-Do (Vansh): decrease opacity
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/camera.png"),
                        )),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Be thankful for what you have;",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "you will end up having more.",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

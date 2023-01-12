import 'package:flutter/material.dart';
import './home_screen.dart';
import 'package:mytica/data/local/db/app_db.dart';
import 'package:drift/drift.dart' as drift;

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
          title: const Text("Sign up"),
        ),
        body: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.all(72),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 0.40,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Sign up"),
                      TextFormField(
                        controller: _fullnameSignupEditController,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Full Name'),
                      ),
                      TextFormField(
                        controller: _usernameSignupEditController,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Username'),
                      ),
                      TextFormField(
                        controller: _passwrodSignupEditController,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Password'),
                      ),
                      Container(
                        margin: const EdgeInsets.all(12),
                        padding: const EdgeInsets.all(12),
                        child: ElevatedButton(
                            onPressed: () {
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

                              // Navigator.of(context)
                              // .pushNamed(HomeScreen.routeName);
                            },
                            child: const Text("Sign up")),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.55,
                // color: Colors.green,
                child: const Text("Image"),
              ),
            ],
          ),
        ));
  }
}

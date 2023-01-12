import 'package:flutter/material.dart';
import '../main-screen/home_screen.dart';
import '../main-screen/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/login-screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Container(
          decoration: const BoxDecoration(  
              gradient: LinearGradient(
                  colors: [Color(0xffADD8FF), Color(0xffEBF5FF)], //final - 1
                  stops: [0.4, 0.7],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Card(
                  elevation: 5,
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
                            end: Alignment.bottomLeft)),
                    padding: const EdgeInsets.all(24),
                    alignment: Alignment.center,
                    // color: Colors.red,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Mystica"),
                        TextFormField(
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Username'),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Password'),
                        ),
                        Container(
                          //color: Colors.teal,
                          padding: const EdgeInsets.all(24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(HomeScreen.routeName);
                                  },
                                  child: const Text("Login")),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(SignUpScreen.routeName);
                                  },
                                  child: const Text("Sign up")),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
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
                // color: Colors.yellow,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.all(8),
                        // color: Colors.black,
                        padding: const EdgeInsets.all(24),
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: const CircleAvatar(
                          radius: 300,
                          backgroundColor: Colors.transparent,
                          child: Image(
                            image: AssetImage('assets/logo_resized_1.png'),
                            height: 300,
                            width: 300,
                          ),
                        )),
                    /* Container(
                      margin: const EdgeInsets.all(8),
                      height: MediaQuery.of(context).size.height * 0.10,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      // color: Colors.blueGrey,
                      child: Text(
                        "Mystica",
                        style: TextStyle(fontSize: 48),
                      ),
                    ) */
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

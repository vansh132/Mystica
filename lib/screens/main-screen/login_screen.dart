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
          // color: Colors.red,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/image2.jpg',
              ),
              fit: BoxFit.cover,
            ),
/*           decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffADD8FF), Color(0xffEBF5FF)], //final - 1
                stops: [0.4, 0.7],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight), */
          ),
          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(48),
                child: Card(
                  elevation: 14,
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/login_logo.png"))),
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Text(
                                  "Mystica",
                                  style: TextStyle(fontSize: 30),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "Home of emotions, experiences, observations, thoughts, events and many more insights of          sub-conscious",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black54),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Username'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Password'),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(
                                  height: 36,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed(HomeScreen.routeName);
                                    },
                                    child: const Text(
                                      "Login",
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
                                    Text(
                                      "Don't have an account? ",
                                      style: TextStyle(),
                                      textAlign: TextAlign.center,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pushNamed(
                                              SignUpScreen.routeName);
                                        },
                                        child: Text("Sign up"))
                                  ],
                                ),
                                SizedBox(
                                  height: 48,
                                  child: TextButton(
                                    onPressed: () {
                                      /*   Navigator.of(context)
                                          .pushNamed(SignUpScreen.routeName); */
                                    },
                                    child: const Text(
                                      "Forgot Password?",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                    Text("data")
                    /* Container(
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
                        )), */
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

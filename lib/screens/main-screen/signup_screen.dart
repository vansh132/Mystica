import 'package:flutter/material.dart';
import './home_screen.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = '/signup-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign up"),
        ),
        body: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(72),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 0.40,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sign up"),
                      TextFormField(
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Full Name'),
                      ),
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
                        margin: EdgeInsets.all(12),
                        padding: EdgeInsets.all(12),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(HomeScreen.routeName);
                            },
                            child: Text("Sign up")),
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
                child: Text("Image"),
              ),
            ],
          ),
        ));
  }
}
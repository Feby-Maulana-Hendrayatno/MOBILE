import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController txtUsername = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(20),
              child: Column(children: <Widget>[
                TextFormField(
                  controller: txtUsername,
                  decoration: InputDecoration(hintText: "Masukan Username"),
                ),
                TextFormField(
                  controller: txtPassword,
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Masukan Password"),
                ),
                ButtonTheme(
                  minWidth: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      String username = txtUsername.text;
                      String password = txtPassword.text;
                      if (username == "admin" && password == "admin") {
                        showDialog(
                            builder: (context) => AlertDialog(
                                  title: Text("Login"),
                                  content: Text("Login Berehasil"),
                                  actions: <Widget>[
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("OK"))
                                  ],
                                ),
                            context: context);
                      }
                    },
                    child: Text("Login", style: TextStyle(color: Colors.white)),
                  ),
                )
              ]))
        ],
      ),
    );
  }
}

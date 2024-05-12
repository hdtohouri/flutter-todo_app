import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  "Bienvenue",
                  style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber[400]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  "Veuillez vous connecter",
                  style: TextStyle(fontSize: 24, color: Colors.grey[500]),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            label: Text("Email"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            label: Text("Password"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 100),
                            child: Text(
                              "Mot de passe oublié ?",
                              style: TextStyle(fontSize: 15),
                            )),
                        SizedBox(
                          height: 60,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "SE CONNECTER",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange[400],
                            //primary: Colors.green,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            minimumSize: Size(300, 50),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Ou continuer avec",
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[500]),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                          children: [
                            Tab(icon: Image.asset("images/facebook.png"),),
                            Tab(icon: Image.asset("images/github.jpg"),),
                            Tab(icon: Image.asset("images/google.png"),),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text("Pas de compte ? S'incrire",style: TextStyle(fontSize: 15))
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

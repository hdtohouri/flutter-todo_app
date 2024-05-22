import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './register.dart';
import './home.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class UserLogin {
  String? email;
  String? password;

  UserLogin({
    required this.email,
    required this.password,
  });

  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'email': String? email,
        'password': String? password,
      } =>
        UserLogin(
          email: email,
          password: password,
        ),
      _ => throw const FormatException('Failed No User found.'),
    };
  }
}

Future<UserLogin> VerifyLogin(String email, String password) async {
  final response = await http.post(
    Uri.parse('http://192.168.1.8:5000/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    print("ok");
    return UserLogin.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception(
        'Username ou mot de passe invalide, aucun utilisateur trouvé');
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  Future<UserLogin>? _futureLogin;
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  String? password;
  String? email;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/register': (context) => Register(),
      },
      home: Builder(
        builder: (context) {
          return Scaffold(
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
                            TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez saisir votre email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                label: Text("Email"),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez saisir votre mot de passe';
                                }
                                return null;
                              },
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
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    email = emailController.text;
                                    password = passwordController.text;
                                  });
                                  try {
                                    _futureLogin = VerifyLogin(email!, password!);
                                   // if (_futureLogin != null) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Home()));
                                      //Navigator.pushNamed(context, '/home');
                                   // }
                                  } catch (e) {
                                    print(e);
                                  }
                                }
                              },
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Tab(
                                  icon: Image.asset("images/facebook.png"),
                                ),
                                Tab(
                                  icon: Image.asset("images/github.jpg"),
                                ),
                                Tab(
                                  icon: Image.asset("images/google.png"),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 80),
                                  child: Text("Pas de compte ?",
                                      style: TextStyle(fontSize: 17)),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Register()));
                                    },
                                    child: Text("S'incrire ",
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.orange[400])))
                              ],
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

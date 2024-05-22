import 'package:flutter/material.dart';
import './login.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class UserRegister {
  String? email;
  String? username;
  String? password;

  UserRegister({
    required this.email,
    required this.username,
    required this.password,
  });

  factory UserRegister.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'email': String? email,
        'username': String? username,
        'password': String? password,
      } =>
        UserRegister(
          email: email,
          username: username,
          password: password,
        ),
      _ => throw const FormatException('Failed to register User.'),
    };
  }
}


Future<UserRegister> saveUser(String email, String username, String password) async {
  final response = await http
      .post(Uri.parse('http://192.168.1.3:5000/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
            'email': email,
            'username': username,
            'password': password,
        }),
      
      );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return UserRegister.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Erreur lors de l\'enregistement de l\'utilisateur');
  }
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  Future<UserRegister>? _futureRegister;
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var usernameController = TextEditingController();
  String? email;
  String? password;
  String? username;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => Login(),
      },
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
                  "Veuillez vous inscrire",
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
                              return 'Veuillez saisir votre adresse email';
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
                          controller: usernameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez saisir votre nom d`\'utilisateur';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text("Nom d'utilisateur"),
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
                          obscureText: true,
                          decoration: InputDecoration(
                            label: Text("Password"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          onPressed: () {
                           if (_formKey.currentState!.validate()) {
                              setState(() {
                                email = emailController.text;
                                username = usernameController.text;
                                password = passwordController.text;
                                _futureRegister = saveUser(email!, username!, password!);
                               // Navigator.pop(context, MaterialPageRoute(builder: (context) => const Login()));
                              });
                            }
                          },
                          child: Text(
                            "S'INSCRIRE",
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
                          height: 25,
                        ),
                        //RichText(text: text)
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text("Vous avez un compte ?",
                              style: TextStyle(fontSize: 17)),
                            ),
                            SizedBox(width: 5,),
                            InkWell(
                              onTap: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                              },
                              child: Text("Se connecter",
                              style: TextStyle(fontSize: 17, color: Colors.orange[400])),
                            )
                          ],
                        )
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

import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var usernameController = TextEditingController();
  String? email;
  String? password;
  String? username;

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
                          onPressed: () {},
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
                        Text("Vous avez un compte ? Se connecter",
                            style: TextStyle(fontSize: 15))
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

// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60),
          Center(
            child: Container(
              height: 100,
              width: 250,
              child: Column(
                children: [
                  _containerPassword(),
                  _containerEmail(),
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
          _loginButton(),
        ],
      ),
    );
  }
}

//TODO Collect what is written within the text field email

_containerEmail() {
  return TextField(
    decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(Icons.email_outlined),
        hintText: 'Email'),
    keyboardType: TextInputType.emailAddress,
  );
}

//TODO Collect what is written within the text field login

_containerPassword() {
  return TextField(
    decoration: InputDecoration(
      border: InputBorder.none,
      icon: Icon(Icons.person_outline),
      hintText: 'Senha',
    ),
    keyboardType: TextInputType.emailAddress,
  );
}

//TODO Check the email and password and redirect to the page sucessfull

_loginButton() {
  return Padding(
    padding: const EdgeInsets.all(30.0),
    child: SizedBox(
      height: 45,
      width: 200,
      child: ElevatedButton(
        onPressed: null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        child: Text("Login"),
      ),
    ),
  );
}

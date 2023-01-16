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
          _containerLogin(),
          _containerEmail(),
        ],
      ),
    );
  }
}

//TODO
_containerEmail() {
  return TextField(
    decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(Icons.email_outlined),
        hintText: 'Email'),
    keyboardType: TextInputType.emailAddress,
  );
}

_containerLogin() {
  return TextField(
    decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(Icons.person_outline),
        hintText: 'Senha'),
    keyboardType: TextInputType.emailAddress,
  );
}

_loginButton() {}

// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

bool check1 = true;
_containerEmail() {
  return TextField(
    decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(Icons.email_outlined),
        hintText: 'Email'),
    keyboardType: TextInputType.emailAddress,
  );
}

_containerPassword() {
  return Column(
    children: [
      TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.person_outline),
          hintText: 'Senha',
        ),
        obscureText: !check1,
        keyboardType: TextInputType.text,
      ),
    ],
  );
}

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
                  _containerEmail(),
                  _containerPassword(),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Ver sua senha?'),
                  Checkbox(
                      //only check box
                      value: check1, //unchecked
                      onChanged: (bool? value) {
                        //value returned when checkbox is clicked
                        setState(() {
                          check1 = value!;
                        });
                      }),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          _loginButton(),
        ],
      ),
    );
  }
}

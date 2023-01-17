// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:login/signupPage/signupScreen.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

String wrongmessage = '';
bool check1 = false;

@override
_containerEmail() {
  return TextField(
    controller: emailController,
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
        controller: passwordController,
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

//TODO check if the account exists and the credentials match

_loginButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(30.0),
    child: SizedBox(
      height: 45,
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          if (emailController.text != 'vasco' &&
              passwordController.text != 'vasco') {
            return;
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => loginPage()),
            );
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        child: Text("Login"),
      ),
    ),
  );
}

_redirectToSignupScreen(context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => signupScreen()),
      );
    },
    child: Text('Não tem uma conta criada? Criar'),
  );
}

class _loginPageState extends State<loginPage> {
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
          _loginButton(context),
          _redirectToSignupScreen(context),
        ],
      ),
    );
  }
}

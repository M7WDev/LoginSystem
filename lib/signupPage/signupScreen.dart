import 'package:flutter/material.dart';
import 'package:login/loginPage/loginScreen.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({super.key});

  @override
  State<signupScreen> createState() => _signupScreenState();
}
//TODO confirm that what is placed is an email and add controller

_containerEmail() {
  return TextField(
    decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(Icons.email_outlined),
        hintText: 'Email'),
    keyboardType: TextInputType.emailAddress,
  );
}

//TODO check the password size and add controller

_containerPassword() {
  return TextField(
    decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(Icons.person_outline),
        hintText: 'Senha'),
    keyboardType: TextInputType.emailAddress,
    obscureText: true,
  );
}

//TODO check whether passwords check and add controller

_containerPasswordConfirm() {
  return TextField(
    decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(Icons.person_outline),
        hintText: 'Confirmar senha'),
    keyboardType: TextInputType.emailAddress,
    obscureText: true,
  );
}

//TODO check that the fields are not empty and create the account with firebase

_signupButton(BuildContext context) {
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
              MaterialPageRoute(builder: (context) => signupScreen()),
            );
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        child: Text("Criar conta"),
      ),
    ),
  );
}

_redirectToLoginScreen(context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => loginPage()),
      );
    },
    child: Text('Já possui uma conta? Logar'),
  );
}

class _signupScreenState extends State<signupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60),
          Center(
            child: Container(
              height: 150,
              width: 250,
              child: Column(
                children: [
                  _containerEmail(),
                  _containerPassword(),
                  _containerPasswordConfirm(),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          _signupButton(context),
          _redirectToLoginScreen(context),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:login/loginPage/loginScreen.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({super.key});

  @override
  State<signupScreen> createState() => _signupScreenState();
}

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController passwordConfirmController = TextEditingController();

_containerEmail() {
  return TextFormField(
    controller: emailController,
    autovalidateMode: AutovalidateMode.always,
    decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(Icons.email_outlined),
        hintText: 'Email'),
    keyboardType: TextInputType.emailAddress,
    validator: (value) {
      if (value != null) {
        if (value.length > 5 && value.contains('@') && value.endsWith('.com')) {
          return null;
        }
        return 'Coloque um email válido';
      }
    },
  );
}

_containerPassword() {
  return TextFormField(
    controller: passwordController,
    autovalidateMode: AutovalidateMode.always,
    decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(Icons.person_outline),
        hintText: 'Senha'),
    keyboardType: TextInputType.emailAddress,
    obscureText: true,
    validator: (value) {
      if (value != null) {
        if (value.length > 5) {
          return null;
        }
        return 'Coloque uma senha maior';
      }
    },
  );
}

//TODO check whether passwords check and add controller

_containerPasswordConfirm() {
  return TextFormField(
    controller: passwordConfirmController,
    autovalidateMode: AutovalidateMode.always,
    decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(Icons.person_outline),
        hintText: 'Confirmar senha'),
    keyboardType: TextInputType.emailAddress,
    obscureText: true,
    validator: (value) {
      if (value != null) {
        if (value.length > 5) {
          return null;
        }
        return 'Coloque uma senha maior';
      }
    },
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
              height: 250,
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

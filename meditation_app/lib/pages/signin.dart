//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/models/users.dart';
import 'package:meditation_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meditation"),
        automaticallyImplyLeading: false,
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Sign in",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20.0,
              width: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Username',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: usernameController,
            ),
            const SizedBox(
              height: 10.0,
              width: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: passwordController,
              obscureText: true, //to have the password hidden ****
            ),
            ElevatedButton(
              onPressed: () {
                context.pushNamed('signup');
              },
              child: const Text("Sign Up"),
            ),
            const SizedBox(
              height: 10.0,
              width: 10.0,
            ),
            ElevatedButton(
              onPressed: () {
                context
                    .read<AuthProvider>()
                    .signin(
                        user: User(
                            username: usernameController.text,
                            password: passwordController.text))
                    .then((token) {
                  if (token.isNotEmpty) {
                    context.pushNamed('home');
                  }
                });
              },
              child: const Text("Sign in"),
            )
          ],
        ),
      ),
    );
  }
}

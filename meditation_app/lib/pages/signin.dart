import 'package:dio/dio.dart';
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
        title: Text("Meditation"),
        automaticallyImplyLeading: false,
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("Sign in"),
            TextField(
              decoration: const InputDecoration(hintText: 'Username'),
              controller: usernameController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Password'),
              controller: passwordController,
              obscureText: true, //to have the password hidden ****
            ),
            ElevatedButton(
              onPressed: () {
                context.pushNamed('signup');
              },
              child: const Text("Sign Up"),
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

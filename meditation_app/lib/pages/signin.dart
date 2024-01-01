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
      backgroundColor: const Color.fromARGB(255, 220, 220, 255),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(40),
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
            // const SizedBox(
            //   height: 20.0,
            //   width: 10.0,
            // ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Username',
                  filled: true,
                  fillColor: const Color.fromARGB(77, 155, 39, 176),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: usernameController,
            ),
            // const SizedBox(
            //   height: 10.0,
            //   width: 10.0,
            // ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: const Color.fromARGB(77, 155, 39, 176),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: passwordController,
              obscureText: true, //to have the password hidden ****
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(119, 155, 39, 176),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ElevatedButton(
                onPressed: () {
                  context.pushNamed('signup');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(82, 250, 3, 233),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 128, 35, 116),
                      Color.fromARGB(77, 155, 39, 176)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<AuthProvider>()
                        .signin(
                          user: User(
                            username: usernameController.text,
                            password: passwordController.text,
                          ),
                        )
                        .then((token) {
                      if (token.isNotEmpty) {
                        context.pushNamed('home');
                      }
                    });
                  },
                  child: const Text("Sign in"),
                ))
          ],
        ),
      ),
    );
  }
}

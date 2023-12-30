//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
//import 'package:go_router/go_router.dart';
import 'package:meditation_app/lists/exercises.dart';
//import 'package:meditation_app/models/users.dart';
//import 'package:meditation_app/providers/auth_provider.dart';
//import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: const Color.fromARGB(255, 255, 131, 7),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 7.0,
          mainAxisSpacing: 7.0,
          childAspectRatio: 1.0,
          mainAxisExtent: 100,
        ),
        itemCount: Exercises.exercises.length,
        itemBuilder: (context, index) {
          return Card(
            color: const Color.fromARGB(255, 33, 194, 243),
            child: Center(
              child: SizedBox(
                width: 100.0,
                height: 100.0,
                child: Center(
                  child: Text(
                    Exercises.exercises[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

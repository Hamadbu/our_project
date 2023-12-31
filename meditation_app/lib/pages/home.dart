//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/Cards/exercise_card.dart';
//import 'package:go_router/go_router.dart';
import 'package:meditation_app/lists/exercises.dart';
import 'package:meditation_app/providers/auth_provider.dart';
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
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              context.pushNamed('profile');
            },
          ),
        ],
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
          return GestureDetector(
            child: ExerciseCard(
              exercise: Exercises.exercises[index],
              // color: const Color.fromARGB(255, 33, 194, 243),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/Cards/exercise_card.dart';
import 'package:meditation_app/lists/exercises.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor:
            Color.fromARGB(255, 220, 220, 255), // Lavender-ish tone
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed('tips');
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.lightbulb, size: 30.0, color: Colors.purple),
            Positioned(
              right: 0,
              bottom: 0,
              child: Icon(Icons.add, size: 20.0, color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 255, 218, 185), // Soft Yellow
      ),
    );
  }
}

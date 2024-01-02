import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/providers/auth_provider.dart';
import 'package:meditation_app/providers/exercise_provider.dart';
//import 'package:meditation_app/providers/tips_provider.dart';
import 'package:provider/provider.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercises"),
        actions: [
          TextButton(
            onPressed: () {
              context
                  .read<AuthProvider>()
                  .logOut()
                  .whenComplete(() => context.goNamed('signin'));
            },
            child: const Text("Logout"),
          ),
        ],
      ),
      body: FutureBuilder(
          future: context.read<ExerciseProvider>().getExerciseList(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Consumer<ExerciseProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.exerciseList.length,
                  itemBuilder: (context, index) {
                    // final thumbsUp = value.exerciseList[index].upvotes!.length ?? 0;
                    // final thumbsDown =
                    //     value.tipsList[index].downvotes!.length ?? 0;

                    // dynamic totalThumbs = thumbsUp - thumbsDown;
                    return Container(
                      width: 300,
                      height: 200,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    value.exerciseList[index].id.toString(),
                                    style: TextStyle(fontSize: 13.0),
                                  ),
                                  Text(
                                    value.exerciseList[index].title.toString(),
                                    style: TextStyle(fontSize: 13.0),
                                  ),
                                  // Expanded(
                                  //   child: Text(
                                  //     value.exerciseList[index].file.toString(),
                                  //     style: TextStyle(fontSize: 13.0),
                                  //   ),
                                  // ),
                                  Text(
                                    value.exerciseList[index].finished
                                        .toString(),
                                    style: TextStyle(fontSize: 13.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }),
    );
  }
}

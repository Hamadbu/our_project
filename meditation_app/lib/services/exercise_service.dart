import 'package:dio/dio.dart';
import 'package:meditation_app/models/exercise_model.dart';
//import 'package:meditation_app/models/tips_model.dart';
//import 'package:meditation_app/providers/tips_provider.dart';
import 'package:meditation_app/services/client.dart';

class ExerciseServices {
  Future<List<Exercises>> getExerciseListApi() async {
    try {
      final responseValue = await ApiClient.get("/exercises");
      print("data");
      if (responseValue.statusCode == 200) {
        print("data ${responseValue.data}");
        final List<Exercises> exercise = List.from(responseValue.data)
            .map((e) => Exercises.fromJson(e))
            .toList();

        print("data ${exercise}");
        return exercise;
      }
      return [];
    } catch (e) {
      throw e.toString();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:meditation_app/models/exercise_model.dart';
import 'package:meditation_app/models/tips_model.dart';
import 'package:meditation_app/pages/exercise_page.dart';
import 'package:meditation_app/services/exercise_service.dart';
import 'package:meditation_app/services/tips_servies.dart';

class ExerciseProvider extends ChangeNotifier {
  List<Exercises> exerciseList = [];

  final _execisesServices = ExerciseServices();

  Future<void> getExerciseList() async {
    exerciseList = await _execisesServices.getExerciseListApi();
    notifyListeners();
  }
}

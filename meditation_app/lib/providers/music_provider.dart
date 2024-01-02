import 'package:flutter/material.dart';
import 'package:meditation_app/models/exercise_model.dart';
import 'package:meditation_app/models/music_model.dart';
import 'package:meditation_app/models/tips_model.dart';
import 'package:meditation_app/pages/exercise_page.dart';
import 'package:meditation_app/services/exercise_service.dart';
import 'package:meditation_app/services/music_service.dart';
import 'package:meditation_app/services/tips_servies.dart';

class MusicProvider extends ChangeNotifier {
  List<Music> musicList = [];

  final _musicServices = MusicServices();

  Future<void> getMusicList() async {
    musicList = await _musicServices.getMusicListApi();
    notifyListeners();
  }
}

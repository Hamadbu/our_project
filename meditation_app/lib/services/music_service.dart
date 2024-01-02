import 'package:dio/dio.dart';
import 'package:meditation_app/models/exercise_model.dart';
import 'package:meditation_app/models/music_model.dart';

import 'package:meditation_app/services/client.dart';

class MusicServices {
  Future<List<Music>> getMusicListApi() async {
    try {
      final responseValue = await ApiClient.get("/music");
      print("data");
      if (responseValue.statusCode == 200) {
        print("data ${responseValue.data}");
        final List<Music> music = List.from(responseValue.data)
            .map((e) => Music.fromJson(e))
            .toList();

        return music;
      }
      return [];
    } catch (e) {
      throw e.toString();
    }
  }
}

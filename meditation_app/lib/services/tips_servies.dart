import 'package:dio/dio.dart';
import 'package:meditation_app/models/tips_model.dart';
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:meditation_app/services/client.dart';

class TipsServices {
  Future<List<Tips>> getTipsListApi() async {
    try {
      final responseValue = await ApiClient.get("/tips");
      if (responseValue.statusCode == 200) {
        final List<Tips> tips =
            List.from(responseValue.data).map((e) => Tips.fromJson(e)).toList();
        return tips;
      }
      return [];
    } catch (e) {
      throw e.toString();
    }
  }

  createTipsApi(String tipsName) async {
    try {
      final Response response = await ApiClient.post(
        "/tips",
        data: {"text": tipsName},
      );
      return response.data;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<Tips>> deleteTipsApi(int id) async {
    try {
      final Response response = await ApiClient.delete(
        "/tips/$id",
      );
      return response.data;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<Tips>> upvoteTipsApi(int id) async {
    try {
      final Response response = await ApiClient.put(
        "/tips/$id/upvote",
      );
      return response.data;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<Tips>> downvoteTipsApi(int id) async {
    try {
      final Response response = await ApiClient.put(
        "/tips/$id/downvote",
      );
      return response.data;
    } catch (e) {
      throw e.toString();
    }
  }
}

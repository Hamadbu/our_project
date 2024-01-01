import 'package:flutter/material.dart';
import 'package:meditation_app/models/tips_model.dart';
import 'package:meditation_app/services/tips_servies.dart';

class TipsProvider extends ChangeNotifier {
  List<Tips> tipsList = [];
  final TipsServices _tipsServices = TipsServices();

  Future<void> getTipsList() async {
    tipsList = await _tipsServices.getTipsListApi();
    notifyListeners();
  }

  Future<void> deleteTip(dynamic id) async {
    await _tipsServices.deleteTipsApi(id);
    await getTipsList();
    notifyListeners();
  }

  Future<void> createNewTips(String tipsName) async {
    await _tipsServices.createTipsApi(tipsName);
    await getTipsList();
  }

  Future<void> upVoteTip(dynamic id) async {
    await _tipsServices.upvoteTipsApi(id);
    await getTipsList();
    notifyListeners();
  }

  Future<void> downVoteTip(dynamic id) async {
    await _tipsServices.downvoteTipsApi(id);
    await getTipsList();
    notifyListeners();
  }
}

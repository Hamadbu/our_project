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

  Future<void> deleteTip(int index) async {
    if (index >= 0 && index < tipsList.length) {
      // await _tipsServices.deleteTipsApi(
      //     tipsList[index].text.toString(), tipsList[index].author.toString());
      tipsList.removeAt(index);

      notifyListeners(); // Notify listeners to rebuild the UI
    }
  }

  Future<void> createNewTips(String tipsName) async {
    await _tipsServices.createTipsApi(tipsName);
    await getTipsList();
  }
}

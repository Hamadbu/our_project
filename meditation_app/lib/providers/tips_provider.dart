import 'package:flutter/material.dart';
import 'package:meditation_app/models/tips_model.dart';
import 'package:meditation_app/services/tips_servies.dart';

class TipsProvider extends ChangeNotifier {
  List<Tips> tipsList = [];

  final TipsServices _tipsServices = TipsServices();

  Future<void> gettipsList() async {
    tipsList = await _tipsServices.getTipsListApi();
    notifyListeners();
  }

  Future<void> createNewtips(String tipsName) async {
    await _tipsServices.createTipsApi(tipsName);
    await gettipsList();
  }
}

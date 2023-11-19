import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/hive/model/ranking.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:path_provider/path_provider.dart' as path_provider;

class RankingViewModel extends ChangeNotifier {
  late Box<Ranking> _RankingBox;

  List<Ranking> _rankings = [];
  List<Ranking> get rankings => _rankings;

  RankingViewModel() {
    _openRankingBox();
  }

  static Future<void> initializeHive() async {
    final appDocumentDir =
    await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(RankingAdapter());
  }

  Future<void> _openRankingBox() async {
    await Hive.openBox<Ranking>('rankings');
    _RankingBox = Hive.box<Ranking>('rankings');

    await _loadRankings();
  }

  Future<void> _loadRankings() async {
    final RankingsList = await _RankingBox.values.toList();

    _rankings = RankingsList;

    notifyListeners();
  }

  Future<void> addRanking(Ranking ranking) async {
    await _RankingBox.add(Ranking(name: ranking.name));

    await _loadRankings();

    notifyListeners();
  }
}

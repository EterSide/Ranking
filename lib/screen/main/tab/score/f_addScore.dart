import 'dart:ffi';

import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/hive/model/ranking.dart';
import 'package:fast_app_base/hive/view_model/ranking_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddScoreFragment extends StatefulWidget {
  const AddScoreFragment({super.key});

  @override
  State<AddScoreFragment> createState() => _AddScoreFragmentState();
}

class _AddScoreFragmentState extends State<AddScoreFragment> {
  String? _selectedValue;
  String? _selectedValue2;

  @override
  Widget build(BuildContext context) {
    final name = TextEditingController();
    final rankings = Provider.of<RankingViewModel>(context);
    final rankingsList = rankings.rankings;

    _getNameList() {
      var nameList = [];
      for (int i = 0; i < rankingsList.length; i++) {
        nameList.add(rankingsList[i].name);
      }
      return nameList;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('전적추가'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton(
                  value: _selectedValue,
                  hint: Text('이름'),
                  items: _getNameList()
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value as String?;
                      print(_selectedValue);
                    });
                  },
                ),
                DropdownButton(
                  value: _selectedValue2,
                  hint: Text('이름'),
                  items: _getNameList()
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (value1) {
                    setState(() {
                      _selectedValue2 = value1 as String?;
                      print(_selectedValue2);
                    });
                  },
                ),
                TextButton(
                  onPressed: () {
                    int? point;
                    for (int i = 0; i < rankingsList.length; i++) {
                      if (rankingsList[i].name == _selectedValue &&
                          (rankingsList[i].win + rankingsList[i].lose) > 0) {
                        final ranking = rankingsList[i];
                        double winningRate = ((ranking.win + 1) /
                                (ranking.win + ranking.lose + 1)) *
                            100;
                        point = ranking.point + 10;
                        rankings.addScore(
                          ranking.key,
                          Ranking(
                            name: ranking.name,
                            win: ranking.win + 1,
                            lose: ranking.lose,
                            winningRate: winningRate,
                            point: point,
                          ),
                        );
                      } else if (rankingsList[i].name == _selectedValue) {
                        final ranking = rankingsList[i];
                        rankings.addScore(
                          ranking.key,
                          Ranking(
                            name: ranking.name,
                            win: ranking.win + 1,
                            winningRate: 100,
                            point: 10,
                          ),
                        );
                      }
                      if (rankingsList[i].name == _selectedValue2 &&
                          (rankingsList[i].win + rankingsList[i].lose) > 0) {
                        final ranking = rankingsList[i];
                        double winningRate =
                            (ranking.win / (ranking.win + ranking.lose + 1)) *
                                100;
                        point = ranking.point - 10;
                        rankings.addScore(
                          ranking.key,
                          Ranking(
                            name: ranking.name,
                            win: ranking.win,
                            lose: ranking.lose + 1,
                            winningRate: winningRate,
                            point: point,
                          ),
                        );
                      } else if (rankingsList[i].name == _selectedValue2) {
                        final ranking = rankingsList[i];
                        rankings.addScore(
                          ranking.key,
                          Ranking(
                            name: ranking.name,
                            lose: ranking.lose + 1,
                            winningRate: 0,
                            point: -10,
                          ),
                        );
                      }
                    }
                    Navigator.of(context).pop();
                  },
                  child: Text('승리'),
                ),
                TextButton(
                  onPressed: () {
                    for (int i = 0; i < rankingsList.length; i++) {
                      if (rankingsList[i].name == _selectedValue &&
                          (rankingsList[i].win + rankingsList[i].lose) > 0) {
                        final ranking = rankingsList[i];
                        double winningRate =
                            (ranking.win / (ranking.win + ranking.lose + 1)) *
                                100;
                        rankings.addScore(
                          ranking.key,
                          Ranking(
                            name: ranking.name,
                            win: ranking.win,
                            lose: ranking.lose + 1,
                            winningRate: winningRate,
                          ),
                        );
                      } else if (rankingsList[i].name == _selectedValue) {
                        final ranking = rankingsList[i];
                        rankings.addScore(
                          ranking.key,
                          Ranking(
                            name: ranking.name,
                            lose: ranking.lose + 1,
                            winningRate: 0,
                          ),
                        );
                      }
                      if (rankingsList[i].name == _selectedValue2 &&
                          (rankingsList[i].win + rankingsList[i].lose) > 0) {
                        final ranking = rankingsList[i];
                        double winningRate = ((ranking.win + 1) /
                            (ranking.win + ranking.lose + 1)) *
                            100;
                        rankings.addScore(
                          ranking.key,
                          Ranking(
                            name: ranking.name,
                            win: ranking.win + 1,
                            lose: ranking.lose,
                            winningRate: winningRate,
                          ),
                        );
                      } else if (rankingsList[i].name == _selectedValue2) {
                        final ranking = rankingsList[i];
                        rankings.addScore(
                          ranking.key,
                          Ranking(
                            name: ranking.name,
                            win: ranking.win + 1,
                            winningRate: 100,
                          ),
                        );
                      }
                    }
                    Navigator.of(context).pop();
                  },
                  child: Text('패배'),
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  print(rankingsList.toList());
                  Navigator.of(context).pop();
                },
                child: Text('등록')),
          ],
        ),
      ),
    );
  }
}

class _TextFormField extends StatelessWidget {
  final TextEditingController tec;
  final String labelText;
  final String hintText;

  const _TextFormField(
      {super.key,
      required this.tec,
      required this.labelText,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: tec,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}

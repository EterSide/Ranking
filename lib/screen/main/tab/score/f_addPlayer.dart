import 'package:fast_app_base/hive/model/ranking.dart';
import 'package:fast_app_base/hive/view_model/ranking_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPlayerFragment extends StatelessWidget {
  const AddPlayerFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final name = TextEditingController();
    final rankings = Provider.of<RankingViewModel>(context);
    final rankingsList = rankings.rankings;

    return Scaffold(
      appBar: AppBar(
        title: Text('선수추가'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            _TextFormField(tec: name, labelText: '이름', hintText: '이름을 작성해주세요'),
            TextButton(
                onPressed: () {

                  if (rankingsList.length == null) {
                    rankings.addRanking(Ranking(name: name.text));
                  } else {
                    rankings.addRanking(Ranking(
                        name: name.text, rank: rankingsList.length + 1));
                  }

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

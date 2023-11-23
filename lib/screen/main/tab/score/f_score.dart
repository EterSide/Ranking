import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/score/f_addPlayer.dart';
import 'package:fast_app_base/screen/main/tab/score/f_addScore.dart';
import 'package:flutter/material.dart';

class ScoreFragment extends StatelessWidget {
  const ScoreFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Image.asset(
            'assets/image/icon/diagram.png',
            height: MediaQuery.of(context).size.height / 6,
          ),
          Text(
            '전적추가',
            style: TextStyle(fontSize: 40, color: Colors.amber),
          ),
          TextButton(
            onPressed: () {
              Nav.push(AddPlayerFragment());
            },
            child: Text('선수등록'),
          ),
          TextButton(
            onPressed: () {
              Nav.push(AddScoreFragment());
            },
            child: Text('전적등록'),
          ),
        ],
      ),
    );
  }
}

class _Text extends StatelessWidget {
  final String lankList;
  final Color? color;

  const _Text({super.key, required this.lankList, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      lankList,
      style: TextStyle(fontSize: 20, color: color),
    );
  }
}




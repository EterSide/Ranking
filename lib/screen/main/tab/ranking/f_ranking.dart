import 'package:flutter/material.dart';

class RankingFragment extends StatelessWidget {
  const RankingFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Image.asset(
            'assets/image/icon/free-icon-ranking-1603847.png',
            height: MediaQuery.of(context).size.height / 6,
          ),
          Text(
            '랭킹',
            style: TextStyle(fontSize: 40, color: Colors.amber),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _Text(
                lankList: '등수',
              ),
              _Text(
                lankList: '이름',
              ),
              _Text(
                lankList: '승',
                color: Colors.red,
              ),
              _Text(
                lankList: '패',
                color: Colors.blue,
              ),
              _Text(
                lankList: '승률',
                color: Colors.red,
              ),
            ],
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

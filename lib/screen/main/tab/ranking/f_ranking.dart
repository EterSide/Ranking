import 'package:fast_app_base/hive/view_model/ranking_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RankingFragment extends StatelessWidget {
  const RankingFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final rankings = Provider.of<RankingViewModel>(context);
    final rankingsList = rankings.rankings;
    List<DataRow> _getRankingList() {
      List<DataRow> dataRow = [];
      for (int i = 0; i < rankingsList.length; i++) {
        var cells = [
          DataCell(Text(rankingsList[i].rank.toString())),
          DataCell(Text(rankingsList[i].name)),
          DataCell(Text(rankingsList[i].win.toString())),
          DataCell(Text(rankingsList[i].lose.toString())),
          DataCell(Text(rankingsList[i].winningRate.toString())),
        ];
        print(cells);
        dataRow.add(DataRow(cells: cells));
      }
      return dataRow;
    }

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
          DataTable(
            horizontalMargin: 10,
            columns: [
              DataColumn(
                label: _Text(
                  lankList: '등수',
                ),
              ),
              DataColumn(
                label: _Text(
                  lankList: '이름',
                ),
              ),
              DataColumn(
                label: _Text(
                  lankList: '승',
                  color: Colors.red,
                ),
              ),
              DataColumn(
                label: _Text(
                  lankList: '패',
                  color: Colors.blue,
                ),
              ),
              DataColumn(
                label: _Text(
                  lankList: '승률',
                  color: Colors.red,
                ),
              ),
            ],
            rows: _getRankingList(),
          ),
          TextButton(
              onPressed: () {
                print(_getRankingList().length);
              },
              child: Text('테스트')),
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

class _DataTable extends StatelessWidget {
  const _DataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      horizontalMargin: 10,
      columns: [
        DataColumn(
          label: _Text(
            lankList: '등수',
          ),
        ),
        DataColumn(
          label: _Text(
            lankList: '이름',
          ),
        ),
        DataColumn(
          label: _Text(
            lankList: '승',
            color: Colors.red,
          ),
        ),
        DataColumn(
          label: _Text(
            lankList: '패',
            color: Colors.blue,
          ),
        ),
        DataColumn(
          label: _Text(
            lankList: '승률',
            color: Colors.red,
          ),
        ),
      ],
      rows: [],
    );
  }
}

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
  @override
  Widget build(BuildContext context) {
    final name = TextEditingController();
    final rankings = Provider.of<RankingViewModel>(context);
    final rankingsList = rankings.rankings;

    String? _selectedValue;


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
                  _selectedValue = value.toString();
                  print(_selectedValue);
                });
              },
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

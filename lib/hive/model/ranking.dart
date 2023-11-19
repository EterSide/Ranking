import 'package:hive/hive.dart';

part 'ranking.g.dart';

@HiveType(typeId: 0)
class Ranking extends HiveObject {
  @HiveField(0)
  int rank;

  @HiveField(1)
  String name;

  @HiveField(2)
  int win;

  @HiveField(3)
  int lose;

  @HiveField(4)
  double winningRate;

  Ranking({
    this.rank = 1,
    required this.name,
    this.win = 0,
    this.lose = 0,
    this.winningRate = 0,
  });
}

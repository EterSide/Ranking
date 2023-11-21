import 'package:hive/hive.dart';

part 'ranking.g.dart';

@HiveType(typeId: 0)
class Ranking extends HiveObject {
  @HiveField(0)
  int rank;

  @HiveField(1)
  String name;

  @HiveField(2)
  double win;

  @HiveField(3)
  double lose;

  @HiveField(4)
  double winningRate;

  @HiveField(5)
  int point;

  Ranking({
    this.rank = 1,
    required this.name,
    this.win = 0,
    this.lose = 0,
    this.winningRate = 0,
    this.point = 0,
  });
}

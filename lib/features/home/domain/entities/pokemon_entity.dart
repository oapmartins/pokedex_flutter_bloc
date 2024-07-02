import 'package:pokedex_flutter_bloc/features/home/domain/entities/next_evolution_entity.dart';

class PokemonEntity {
  int? id;
  String? num;
  String? name;
  String? img;
  List<String>? type;
  String? height;
  String? weight;
  String? candy;
  int? candyCount;
  String? egg;
  dynamic spawnChance;
  dynamic avgSpawns;
  String? spawnTime;
  List<dynamic>? multipliers;
  List<String>? weaknesses;
  List<NextEvolutionEntity>? nextEvolution;

  PokemonEntity({
    this.id,
    this.num,
    this.name,
    this.img,
    this.type,
    this.height,
    this.weight,
    this.candy,
    this.candyCount,
    this.egg,
    this.spawnChance,
    this.avgSpawns,
    this.spawnTime,
    this.multipliers,
    this.weaknesses,
    this.nextEvolution,
  });
}

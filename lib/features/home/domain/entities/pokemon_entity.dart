class PokemonEntity {
  int? id;
  String? number;
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

  PokemonEntity({
    this.id,
    this.number,
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
  });
}

class Pokemon {
  int? id;
  int? height;
  String? name;
  List<Stats>? stats;
  List<String>? types;
  int? weight;

  Pokemon(this.id, this.height, this.name, this.stats, this.types, this.weight);

  String get imageUrl =>
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";
}

class Stats {
  int? stat;
  String? name;

  Stats({
    this.stat,
    this.name,
  });
}

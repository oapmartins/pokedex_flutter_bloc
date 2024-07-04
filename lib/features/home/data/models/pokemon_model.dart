import 'package:pokedex_flutter_bloc/features/home/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  PokemonModel(
    super.id,
    super.height,
    super.name,
    super.stats,
    super.types,
    super.weight,
  );

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      map['id'],
      map['height'],
      firstLetterToUpperCase(map['name']),
      List<Stats>.from(map['stats']?.map((x) => StatsModel.fromMap(x))),
      List<String>.from(map['types']?.map((x) {
        return firstLetterToUpperCase(TypesModel.fromMap(x).types);
      })),
      map['weight'],
    );
  }

  static firstLetterToUpperCase(String word) {
    return "${word[0].toUpperCase()}${word.toLowerCase().substring(1)}";
  }
}

class StatsModel extends Stats {
  StatsModel({
    super.stat,
    super.name,
  });

  StatsModel copyWith({
    int? stat,
    String? name,
  }) {
    return StatsModel(
      stat: stat ?? this.stat,
      name: name ?? this.name,
    );
  }

  factory StatsModel.fromMap(Map<String, dynamic> map) {
    int stat = map['base_stat'];
    String name = map['stat']['name'];
    if (name == "hp") {
      return StatsModel(stat: stat, name: "HP ");
    } else if (name == "attack") {
      return StatsModel(stat: stat, name: "ATK");
    } else if (name == "defense") {
      return StatsModel(stat: stat, name: "DEF");
    } else if (name == "special-attack") {
      return StatsModel(stat: stat, name: "STK");
    } else if (name == "special-defense") {
      return StatsModel(stat: stat, name: "SEF");
    } else if (name == "speed") {
      return StatsModel(stat: stat, name: "SPD");
    } else {
      return StatsModel(stat: stat, name: name);
    }
  }
}

class TypesModel {
  TypesModel({
    required this.types,
  });

  final String types;

  TypesModel copyWith({
    String? types,
  }) {
    return TypesModel(
      types: types ?? this.types,
    );
  }

  factory TypesModel.fromMap(Map<String, dynamic> map) {
    return TypesModel(
      types: map['type']['name'],
    );
  }
}

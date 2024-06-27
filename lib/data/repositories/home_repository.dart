import 'dart:convert';

import 'package:pokedex_flutter_bloc/data/dataproviders/home_api.dart';
import 'package:pokedex_flutter_bloc/data/models/pokemon_model.dart';

class HomeRepository {
  final HomeApi dataProvider;

  HomeRepository({required this.dataProvider});

  Future<List<PokemonModel>> getPokemons() async {
    List<PokemonModel> pokemons = [];
    final response = await dataProvider.getPokemons();

    for (final pokemonJson in jsonDecode(response)['pokemon']) {
      pokemons.add(PokemonModel.fromJson(pokemonJson));
    }
    return pokemons;
  }
}

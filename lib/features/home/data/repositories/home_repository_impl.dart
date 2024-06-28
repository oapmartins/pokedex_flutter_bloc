import 'dart:convert';

import 'package:pokedex_flutter_bloc/features/home/domain/models/pokemon_model.dart';
import 'package:pokedex_flutter_bloc/features/home/data/data_source/home_api_impl.dart';

class HomeRepositoryImpl {
  final HomeApiImpl homeApiImpl;
  HomeRepositoryImpl(this.homeApiImpl);

  Future<List<PokemonModel>> getPokemons() async {
    List<PokemonModel> pokemons = [];
    final response = await homeApiImpl.getPokemons();

    for (final pokemonJson in jsonDecode(response)['pokemon']) {
      pokemons.add(PokemonModel.fromJson(pokemonJson));
    }
    return pokemons;
  }
}

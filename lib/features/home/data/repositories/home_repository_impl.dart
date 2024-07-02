import 'dart:convert';

import 'package:pokedex_flutter_bloc/features/home/data/models/pokemon_model.dart';
import 'package:pokedex_flutter_bloc/features/home/data/datasources/pokemons_remote_datasource.dart';

class PokemonRepositoryImpl {
  final PokemonRemoteDataSourceImpl pokemonRemoteDataSourceImpl;
  PokemonRepositoryImpl(this.pokemonRemoteDataSourceImpl);

  Future<List<PokemonModel>> getPokemons() async {
    List<PokemonModel> pokemons = [];
    final response = await pokemonRemoteDataSourceImpl.getPokemons();

    for (final pokemonJson in jsonDecode(response)['pokemon']) {
      pokemons.add(PokemonModel.fromJson(pokemonJson));
    }
    return pokemons;
  }
}

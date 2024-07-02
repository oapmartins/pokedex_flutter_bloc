import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokedex_flutter_bloc/features/home/data/models/pokemon_model.dart';

abstract class PokemonRemoteDataSource {
  Future<List<PokemonModel>> getPokemons();
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final Dio dio;

  PokemonRemoteDataSourceImpl(this.dio);

  @override
  Future<List<PokemonModel>> getPokemons() async {
    List<PokemonModel> pokemons = [];
    try {
      final response = await dio.get(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json',
      );
      final retornoApi = response.data.toString();

      for (final pokemonJson in jsonDecode(retornoApi)['pokemon']) {
        pokemons.add(PokemonModel.fromJson(pokemonJson));
      }
      return pokemons;
    } catch (e) {
      return [];
    }
  }
}

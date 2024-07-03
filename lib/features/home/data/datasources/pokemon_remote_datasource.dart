import 'package:dio/dio.dart';
import 'package:pokedex_flutter_bloc/features/home/data/models/pokemon_model.dart';

abstract class PokemonRemoteDataSource {
  Future<List<PokemonModel>> fetchPokemonsPaginate({required int page});
  Future<PokemonModel> fetchPokemon({required String name});
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final Dio dio;

  PokemonRemoteDataSourceImpl(this.dio);

  @override
  Future<List<PokemonModel>> fetchPokemonsPaginate({required int page}) async {
    List<PokemonModel> pokemons = [];

    final response = await dio.get(
      'https://pokeapi.co/api/v2/pokemon?offset=$page&limit=20',
    );

    for (final pokemonResponse in response.data['results']) {
      pokemons.add(await fetchPokemon(name: pokemonResponse['name']));
    }
    return pokemons;
  }

  @override
  Future<PokemonModel> fetchPokemon({required String name}) async {
    final response = await dio.get(
      'https://pokeapi.co/api/v2/pokemon/$name/',
    );
    return PokemonModel.fromMap(response.data);
  }
}

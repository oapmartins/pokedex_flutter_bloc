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
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API responds with 404 when reached the end
        if (e.response?.statusCode == 404) return [];
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e);
      }
    }
    return pokemons;
  }
}

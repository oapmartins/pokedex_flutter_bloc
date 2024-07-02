import 'package:dio/dio.dart';

abstract class PokemonRemoteDataSource {
  Future<String> getPokemons();
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final Dio dio;

  PokemonRemoteDataSourceImpl(this.dio);

  @override
  Future<String> getPokemons() async {
    try {
      final response = await dio.get(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json',
      );
      return response.data.toString();
      
    } catch (e) {
      return e.toString();
    }
  }
}

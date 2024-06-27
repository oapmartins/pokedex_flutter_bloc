import 'package:dio/dio.dart';

class HomeApi {
  final dio = Dio();

  Future<String> getPokemons() async {
    final response = await dio.get(
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json',
    );
    return response.data.toString();
  }
}

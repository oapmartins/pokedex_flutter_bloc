import 'package:dio/dio.dart';
import 'package:pokedex_flutter_bloc/features/home/data/data_source/abstract_home_api.dart';

class HomeApiImpl implements AbstractHomeApi {
  final Dio dio;

  HomeApiImpl(this.dio);

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

import 'package:pokedex_flutter_bloc/features/home/domain/entities/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> fetchPokemonsPaginate({required int page});
}

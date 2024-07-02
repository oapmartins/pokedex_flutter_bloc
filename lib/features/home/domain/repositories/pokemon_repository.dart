import 'package:pokedex_flutter_bloc/features/home/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<List<PokemonEntity>> getPokemons();
}

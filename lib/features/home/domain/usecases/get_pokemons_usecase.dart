import 'package:pokedex_flutter_bloc/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_flutter_bloc/features/home/domain/repositories/pokemon_repository.dart';

class GetPokemonsUsecase {
  final PokemonRepository _pokemonRepository;
  GetPokemonsUsecase(this._pokemonRepository);

  Future<List<PokemonEntity>> call() async {
    return await _pokemonRepository.getPokemons();
  }
}

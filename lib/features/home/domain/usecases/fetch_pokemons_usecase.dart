import 'package:pokedex_flutter_bloc/features/home/domain/entities/pokemon.dart';
import 'package:pokedex_flutter_bloc/features/home/domain/repositories/pokemon_repository.dart';

class FetchPokemonsUsecase {
  final PokemonRepository _pokemonRepository;
  FetchPokemonsUsecase(this._pokemonRepository);

  Future<List<Pokemon>> call({required int page}) async {
    return await _pokemonRepository.fetchPokemonsPaginate(page: page);
  }
}

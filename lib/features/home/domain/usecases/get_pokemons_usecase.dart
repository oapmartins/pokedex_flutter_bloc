import 'package:pokedex_flutter_bloc/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_flutter_bloc/features/home/domain/repositories/pokemon_repository.dart';

class GetPokemonsUsecase {
  GetPokemonsUsecase(this.pokemonRepository);
  final PokemonRepository pokemonRepository;

  Future<List<PokemonEntity>> call() async {
    return await pokemonRepository.getPokemons();
  }
}

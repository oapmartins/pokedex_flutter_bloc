import 'package:pokedex_flutter_bloc/features/home/data/datasources/pokemon_remote_datasource.dart';
import 'package:pokedex_flutter_bloc/features/home/domain/entities/pokemon.dart';
import 'package:pokedex_flutter_bloc/features/home/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSourceImpl pokemonRemoteDataSourceImpl;
  PokemonRepositoryImpl(this.pokemonRemoteDataSourceImpl);

  @override
  Future<List<Pokemon>> fetchPokemonsPaginate({required int page}) async {
    return await pokemonRemoteDataSourceImpl.fetchPokemonsPaginate(page: page);
  }
}

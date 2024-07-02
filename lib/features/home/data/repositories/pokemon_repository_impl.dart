import 'package:pokedex_flutter_bloc/features/home/data/datasources/pokemon_remote_datasource.dart';
import 'package:pokedex_flutter_bloc/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_flutter_bloc/features/home/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSourceImpl pokemonRemoteDataSourceImpl;
  PokemonRepositoryImpl(this.pokemonRemoteDataSourceImpl);

  @override
  Future<List<PokemonEntity>> getPokemons() async {
    return await pokemonRemoteDataSourceImpl.getPokemons();
  }
}

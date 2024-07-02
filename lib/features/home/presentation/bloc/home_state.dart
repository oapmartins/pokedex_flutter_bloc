import 'package:pokedex_flutter_bloc/features/home/domain/entities/pokemon_entity.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<PokemonEntity> pokemons;
  HomeLoadedState({required this.pokemons});
}

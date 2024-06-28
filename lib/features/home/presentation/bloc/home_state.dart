import 'package:pokedex_flutter_bloc/features/home/domain/models/pokemon_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<PokemonModel> pokemons;
  HomeLoadedState({required this.pokemons});
}

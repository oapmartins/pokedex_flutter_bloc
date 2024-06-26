import 'package:pokedex_flutter_bloc/model/pokemon_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {}

class HomeLoadedState extends HomeState {
  HomeLoadedState({required List<PokemonModel> pokemons});
}

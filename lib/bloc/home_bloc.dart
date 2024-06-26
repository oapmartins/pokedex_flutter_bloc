import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:pokedex_flutter_bloc/bloc/home_event.dart';
import 'package:pokedex_flutter_bloc/bloc/home_state.dart';
import 'package:pokedex_flutter_bloc/model/pokemon_model.dart';
import 'package:dio/dio.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>(_mapEventToState);
  }

  void _mapEventToState(HomeEvent homeEvent, Emitter emit) async {
    List<PokemonModel> pokemons = [];

    emit(HomeLoadingState());

    if (homeEvent is GetPokemonsEvent) {
      print('consulta dos pokemons');
      final dio = Dio();
      final response = await dio.get(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json',
      );
      for (final pokemonJson in jsonDecode(response.data)['pokemon']) {
        pokemons.add(PokemonModel.fromJson(pokemonJson));
      }
    }

    emit(HomeLoadedState(pokemons: pokemons));
  }
}

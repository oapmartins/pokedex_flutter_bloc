import 'package:bloc/bloc.dart';
import 'package:pokedex_flutter_bloc/bloc/home_event.dart';
import 'package:pokedex_flutter_bloc/bloc/home_state.dart';
import 'package:pokedex_flutter_bloc/data/models/pokemon_model.dart';
import 'package:pokedex_flutter_bloc/data/repositories/home_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({required this.homeRepository}) : super(HomeInitialState()) {
    on<GetPokemonsEvent>(_getPokemonsEvent);
  }

  void _getPokemonsEvent(HomeEvent homeEvent, Emitter emit) async {
    List<PokemonModel> pokemons = [];
    try {
      emit(HomeLoadingState());
      await Future.delayed(const Duration(seconds: 2));

      pokemons = await homeRepository.getPokemons();
      emit(HomeLoadedState(pokemons: pokemons));
    } catch (e) {
      emit(HomeErrorState());
    }
  }
}

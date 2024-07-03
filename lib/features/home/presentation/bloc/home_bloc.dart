import 'package:bloc/bloc.dart';
import 'package:pokedex_flutter_bloc/features/home/domain/entities/pokemon.dart';
import 'package:pokedex_flutter_bloc/features/home/domain/usecases/fetch_pokemons_usecase.dart';
import 'package:pokedex_flutter_bloc/features/home/presentation/bloc/home_event.dart';
import 'package:pokedex_flutter_bloc/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchPokemonsUsecase fetchPokemonsUsecase;

  HomeBloc(this.fetchPokemonsUsecase) : super(HomeInitialState()) {
    on<FetchPokemonsEvent>(_fetchPokemonsEvent);
    on<SearchListPokemonEvent>(_searchListPokemonEvent);
  }

  List<Pokemon> _listPokemon = [];

  void _fetchPokemonsEvent(FetchPokemonsEvent homeEvent, Emitter emit) async {
    List<Pokemon> pokemons = [];
    try {
      emit(HomeLoadingState());

      pokemons = await fetchPokemonsUsecase.call(page: homeEvent.page);
      _listPokemon = [...pokemons];
      emit(HomeLoadedState(pokemons: pokemons));
    } catch (e) {
      emit(HomeErrorState());
    }
  }

  void _searchListPokemonEvent(SearchListPokemonEvent homeEvent, Emitter emit) {
    try {
      List<Pokemon> filterPokemons = _listPokemon
          .where((Pokemon pokemon) => (pokemon.name ?? '').toLowerCase().contains(
                homeEvent.word.toLowerCase(),
              ))
          .toList();

      emit(HomeLoadedState(pokemons: filterPokemons));
    } catch (e) {
      emit(HomeErrorState());
    }
  }
}

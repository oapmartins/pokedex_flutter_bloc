import 'package:bloc/bloc.dart';
import 'package:pokedex_flutter_bloc/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_flutter_bloc/features/home/presentation/bloc/home_event.dart';
import 'package:pokedex_flutter_bloc/features/home/presentation/bloc/home_state.dart';
import 'package:pokedex_flutter_bloc/features/home/data/repositories/pokemon_repository_impl.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PokemonRepositoryImpl pokemonRepositoryImpl;

  HomeBloc(this.pokemonRepositoryImpl) : super(HomeInitialState()) {
    on<GetPokemonsEvent>(_getPokemonsEvent);
    on<SearchListPokemonEvent>(_searchListPokemonEvent);

    // onFilter
    on<RedoListPokemonsEvent>(_redoListPokemonsEvent);
  }

  List<PokemonEntity> _listPokemon = [];

  void _getPokemonsEvent(GetPokemonsEvent homeEvent, Emitter emit) async {
    List<PokemonEntity> pokemons = [];
    try {
      emit(HomeLoadingState());
      await Future.delayed(const Duration(seconds: 2));

      pokemons = await pokemonRepositoryImpl.getPokemons();
      _listPokemon = [...pokemons];
      emit(HomeLoadedState(pokemons: pokemons));
    } catch (e) {
      emit(HomeErrorState());
    }
  }

  void _searchListPokemonEvent(SearchListPokemonEvent homeEvent, Emitter emit) {
    try {
      List<PokemonEntity> filterPokemons = _listPokemon
          .where((PokemonEntity pokemon) => (pokemon.name ?? '').toLowerCase().contains(
                homeEvent.word.toLowerCase(),
              ))
          .toList();

      emit(HomeLoadedState(pokemons: filterPokemons));
    } catch (e) {
      emit(HomeErrorState());
    }
  }

  void _redoListPokemonsEvent(RedoListPokemonsEvent homeEvent, Emitter emit) {
    emit(HomeLoadedState(pokemons: _listPokemon));
  }
}

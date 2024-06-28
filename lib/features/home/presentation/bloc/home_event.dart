abstract class HomeEvent {}

class GetPokemonsEvent extends HomeEvent {}

class SearchListPokemonEvent extends HomeEvent {
  final String word;

  // lista de pokemons
  SearchListPokemonEvent({
    required this.word,
  });
}

class RedoListPokemonsEvent extends HomeEvent {}

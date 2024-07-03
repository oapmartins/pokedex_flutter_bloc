abstract class HomeEvent {}

class FetchPokemonsEvent extends HomeEvent {
  final int page;
  FetchPokemonsEvent({required this.page});
}

class SearchListPokemonEvent extends HomeEvent {
  final String word;
  SearchListPokemonEvent({required this.word});
}

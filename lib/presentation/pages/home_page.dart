import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter_bloc/bloc/home_bloc.dart';
import 'package:pokedex_flutter_bloc/bloc/home_event.dart';
import 'package:pokedex_flutter_bloc/bloc/home_state.dart';
import 'package:pokedex_flutter_bloc/constants/color_constants.dart';
import 'package:pokedex_flutter_bloc/presentation/widgets/card_pokemon_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc _homeBloc;

  @override
  void initState() {
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc.add(GetPokemonsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pokédex',
              style: TextStyle(
                fontSize: 36,
                color: ColorConstants.gray500,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Use the advanced search to find Pokémon by type, weakness, ability and more!',
              style: TextStyle(
                fontSize: 16,
                color: ColorConstants.gray400,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Expanded(
                  child: SearchBar(
                    constraints: BoxConstraints(minHeight: 48),
                    elevation: WidgetStatePropertyAll(0),
                    padding: WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: 16.0)),
                    leading: Icon(Icons.search),
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                    hintText: 'Search a pokémon',
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                    ),
                    side: WidgetStatePropertyAll(
                      BorderSide(
                        color: ColorConstants.gray200,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 48,
                  height: 48,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: ColorConstants.gray200,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.filter_alt_outlined,
                    size: 16,
                    color: ColorConstants.gray500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoadingState) {
                  return const CircularProgressIndicator();
                } else if (state is HomeErrorState) {
                  return const Center(child: Text('Erro ao realizar consulta'));
                } else if (state is HomeLoadedState) {
                  return Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 100,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        crossAxisCount: 2,
                      ),
                      itemCount: state.pokemons.length,
                      itemBuilder: (buildContext, index) {
                        return CardPokemonWidget(
                          indexPokemon: index,
                          pokemon: state.pokemons[index],
                        );
                      },
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

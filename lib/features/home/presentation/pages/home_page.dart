import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter_bloc/features/home/presentation/bloc/home_bloc.dart';
import 'package:pokedex_flutter_bloc/features/home/presentation/bloc/home_event.dart';
import 'package:pokedex_flutter_bloc/features/home/presentation/bloc/home_state.dart';
import 'package:pokedex_flutter_bloc/core/utils/constants/color_constants.dart';
import 'package:pokedex_flutter_bloc/features/home/presentation/widgets/card_pokemon_widget.dart';
import 'package:pokedex_flutter_bloc/features/home/presentation/widgets/filter/custom_filter_chip_widget.dart';

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 85,
                backgroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pokédex',
                        style: TextStyle(
                          fontSize: 36,
                          color: ColorConstants.gray500,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Use the advanced search to find Pokémon by type, weakness, ability and more!',
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorConstants.gray400,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                expandedHeight: 0,
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                collapsedHeight: 70,
                titleSpacing: 0,
                title: Row(
                  children: [
                    Expanded(
                      child: SearchBar(
                        onChanged: (value) {
                          _homeBloc.add(SearchListPokemonEvent(word: value));
                        },
                        constraints: const BoxConstraints(minHeight: 48),
                        elevation: const WidgetStatePropertyAll(0),
                        padding: const WidgetStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 16.0),
                        ),
                        leading: const Icon(
                          Icons.search,
                          size: 18,
                          color: ColorConstants.gray500,
                        ),
                        backgroundColor: const WidgetStatePropertyAll(Colors.white),
                        hintText: 'Search a pokémon',
                        shape: const WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                        ),
                        side: const WidgetStatePropertyAll(
                          BorderSide(
                            color: ColorConstants.gray200,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet<void>(
                          backgroundColor: Colors.white,
                          context: context,
                          builder: (BuildContext context) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 16),
                                        child: Container(
                                          width: 45,
                                          height: 5,
                                          decoration: BoxDecoration(
                                            color: ColorConstants.gray400,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    'Filters',
                                    style: TextStyle(
                                      color: ColorConstants.gray500,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  const Text(
                                    'Generations',
                                    style: TextStyle(
                                      color: ColorConstants.gray500,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: const Row(
                                      children: [
                                        CustomFilterChipWidget(nameFilter: 'Generation I'),
                                        SizedBox(width: 12),
                                        CustomFilterChipWidget(nameFilter: 'Generation II'),
                                        SizedBox(width: 12),
                                        CustomFilterChipWidget(nameFilter: 'Generation III'),
                                        SizedBox(width: 12),
                                        CustomFilterChipWidget(nameFilter: 'Generation VI'),
                                        SizedBox(width: 12),
                                        CustomFilterChipWidget(nameFilter: 'Generation V'),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: ColorConstants.gray200,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.filter_alt_outlined,
                            size: 18,
                            color: ColorConstants.gray500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoadingState) {
                    return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
                  } else if (state is HomeErrorState) {
                    return const SliverToBoxAdapter(child: SizedBox(height: 0));
                  } else if (state is HomeLoadedState) {
                    return SliverGrid.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 100,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        crossAxisCount: 2,
                      ),
                      itemCount: state.pokemons.length,
                      itemBuilder: (buildContext, index) {
                        return CardPokemonWidget(
                          indexPokemon: state.pokemons[index].id ?? 0,
                          pokemon: state.pokemons[index],
                        );
                      },
                    );
                  } else {
                    return const SliverToBoxAdapter(child: SizedBox(height: 0));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

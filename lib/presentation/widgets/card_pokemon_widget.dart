import 'package:flutter/material.dart';
import 'package:pokedex_flutter_bloc/constants/color_constants.dart';
import 'package:pokedex_flutter_bloc/data/models/pokemon_model.dart';
import 'package:pokedex_flutter_bloc/presentation/widgets/type_widget.dart';

class CardPokemonWidget extends StatelessWidget {
  const CardPokemonWidget({
    super.key,
    required this.pokemon,
    required this.indexPokemon,
  });

  final PokemonModel pokemon;
  final int indexPokemon;

  @override
  Widget build(BuildContext context) {
    final firstType = pokemon.type?.first;

    return Container(
      width: 152,
      height: 100,
      decoration: BoxDecoration(
        color: ColorConstants.colorsTypePokemons[firstType],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 25,
            left: 90,
            child: Image.asset(
              'assets/images/pokeball.png',
              color: Colors.white.withOpacity(.2),
              width: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      pokemon.name ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '#${indexPokemon.toString().padLeft(3, '0')}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: (pokemon.type ?? []).map((type) {
                        return TypeWidget(
                          listTypePokemon: pokemon.type ?? [],
                          typePokemon: type,
                        );
                      }).toList(),
                    ),
                    Image.network(pokemon.img ?? '', width: 56),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
